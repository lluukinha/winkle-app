import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winkle/Screens/Dashboard/Passwords/edit_password_screen.dart';

class PasswordCard extends StatelessWidget {
  const PasswordCard({Key? key}) : super(key: key);

  ButtonStyle optionsButtonStyle() {
    return TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap);
  }

  void launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  void choosePopupOption(int item) {
    if (item == 1) {
      launchURL("https://www.winkle.com.br");
      return;
    }

    if (item == 2) {
      // remove folder
    }
  }

  void moveFolder(int item) {
    print(item);
  }

  void copyText(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green,
          content: Text('Texto copiado para sua área de transferência.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: SizedBox(
            child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                              backgroundColor: Colors.blue, child: Text("F")),
                          const SizedBox(width: 10),
                          Expanded(
                              child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, EditPasswordScreen.routeName);
                            },
                            child: const Text('Nome da senha',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis)),
                          )),
                          PopupMenuButton<int>(
                            onSelected: choosePopupOption,
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                  child: Text("Abrir url"), value: 1),
                              const PopupMenuDivider(),
                              const PopupMenuItem(
                                  child: Text("Remover categoria"),
                                  value: 2,
                                  enabled: false),
                              PopupMenuItem(
                                  child: PopupMenuButton<int>(
                                    onSelected: moveFolder,
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(
                                          child: Text("Categoria 1"), value: 1),
                                      PopupMenuItem(
                                          child: Text("Categoria 2"), value: 2),
                                    ],
                                    child: const Text("Mover para"),
                                  ),
                                  value: 3)
                            ],
                            child: TextButton(
                                style: optionsButtonStyle(),
                                onPressed: null,
                                child: const Icon(Icons.more_vert)),
                          )
                        ]),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "https://www.amazon.com.br/slfjkhsdfjlks/dfksdfsdf//dfgdhfgkjh",
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.copy, size: 14),
                          label: const Text("Login"),
                          onPressed: () {
                            copyText("your text", context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade300,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.copy, size: 14),
                          label: const Text("Senha"),
                          onPressed: () {
                            copyText("sua senha", context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade300,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          child: const Icon(Icons.delete_forever),
                          onPressed: () {
                            print('remove');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade100,
                            onPrimary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
