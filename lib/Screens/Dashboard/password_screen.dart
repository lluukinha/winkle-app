import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  static const routeName = '/dashboard-screen';

  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade400,
      child: ListView(
        children: [
          Card(
              color: Colors.white,
              child: SizedBox(
                  child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    child: Text("FB")),
                                Text(
                                  'Nome da senha',
                                  style: TextStyle(fontSize: 20),
                                ),
                                ElevatedButton(
                                    onPressed: null,
                                    child: Icon(Icons.more_vert))
                              ]),
                          const Text("https://www.amazon.com.br"),
                          const SizedBox(
                            height: 20,
                          ),
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
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red),
                                  icon: const Icon(Icons.delete_forever),
                                  label: const Text("Remover"),
                                  onPressed: () {
                                    print('remove');
                                  })
                            ],
                          )
                        ],
                      )))),
        ],
      ),
    );
  }
}
