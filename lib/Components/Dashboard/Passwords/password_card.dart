import 'package:flutter/material.dart';

class PasswordCard extends StatelessWidget {
  const PasswordCard({Key? key}) : super(key: key);

  ButtonStyle optionsButtonStyle() {
    return TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap);
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
                          const Expanded(
                              child: Text(
                            'Nome da senha',
                            style: TextStyle(
                                fontSize: 20, overflow: TextOverflow.ellipsis),
                          )),
                          TextButton(
                              style: optionsButtonStyle(),
                              onPressed: null,
                              child: const Icon(Icons.more_vert))
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
                            icon: const Icon(Icons.copy),
                            label: const Text("Login"),
                            onPressed: null),
                        ElevatedButton.icon(
                            icon: const Icon(Icons.copy),
                            label: const Text("Senha"),
                            onPressed: null),
                        ElevatedButton.icon(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            icon: const Icon(Icons.delete_forever),
                            label: const Text("Remover"),
                            onPressed: () {
                              print('remove');
                            })
                      ],
                    )
                  ],
                ))));
  }
}
