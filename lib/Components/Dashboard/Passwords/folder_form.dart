import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:winkle/Components/hex_color.dart';
import 'package:winkle/constants.dart';

// Create a Form widget.
class FolderForm extends StatefulWidget {
  const FolderForm({Key? key}) : super(key: key);

  @override
  FolderFormState createState() {
    return FolderFormState();
  }
}

class FolderFormState extends State<FolderForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nome da categoria:"),
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira o nome da categoria';
                }

                if (value.length < 3) {
                  return 'O nome da categoria é muito curto';
                }

                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: HexColor(Constants.winkleBG),
                  minimumSize: const Size.fromHeight(45),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(nameController.value.text);
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Salvando, aguarde...')),
                    );
                  }
                },
                child: const Text(
                  'Enviar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
