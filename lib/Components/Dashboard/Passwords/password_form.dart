import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';
import '../../hex_color.dart';

class PasswordForm extends StatefulWidget {
  PasswordForm({Key? key}) : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  String? selectedUrl;
  bool isShowingPassword = false;

  final urlController = TextEditingController();
  final folderController = TextEditingController();
  final descriptionController = TextEditingController();

  List<Map<String, String>> urlOptions = [
    {'name': "Outro (vou digitar)", 'url': 'https://'},
    {'name': 'Anchor', 'url': 'https://anchor.fm/'},
    {'name': 'Amazon', 'url': 'https://www.amazon.com.br/'},
    {'name': 'Disney+', 'url': 'https://www.disneyplus.com/'},
    {'name': 'Facebook', 'url': 'https://www.facebook.com.br'},
    {'name': 'HBO Max', 'url': 'https://www.hbomax.com/br/'},
    {'name': 'Hotmart', 'url': 'https://www.hotmart.com/'},
    {'name': 'Instagram', 'url': 'https://www.instagram.com/'},
    {'name': 'ICloud', 'url': 'https://www.icloud.com/'},
    {'name': 'Mercado Livre', 'url': 'https://www.mercadolivre.com.br/'},
    {'name': 'Netflix', 'url': 'https://www.netflix.com/'},
    {'name': 'Spotify', 'url': 'https://www.spotify.com/'},
    {'name': 'Star Plus', 'url': 'https://www.starplus.com/'},
    {'name': 'Twitter', 'url': 'https://twitter.com/'},
    {'name': 'Youtube', 'url': 'https://www.youtube.com/'}
  ];

  Map<String, Object> passwordForm = {
    "name": "",
    "url": "",
    "login": "",
    "password": "",
    "description": "",
    "folder": {"id": "", "name": ""},
  };

  Widget renderUrlInput() {
    if (selectedUrl != null) {
      return Row(
        children: [
          Flexible(child: TextFormField(controller: urlController)),
          InkWell(
            onTap: () {
              setState(() {
                selectedUrl = null;
                changeUrlControllerValue('');
              });
            },
            child: const Icon(Icons.menu),
          )
        ],
      );
    }

    return DropdownButtonFormField(
      items: urlOptions.map((urlOption) {
        return DropdownMenuItem(
            value: urlOption["url"], child: Text(urlOption["name"].toString()));
      }).toList(),
      onChanged: (newValue) {
        setState(() => selectedUrl = newValue.toString());
        changeUrlControllerValue(newValue.toString());
      },
      value: selectedUrl,
    );
  }

  void changeUrlControllerValue(String newValue) {
    urlController.text = newValue.toString();
    urlController.value = TextEditingValue(
      text: newValue.toString(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: newValue.toString().length),
      ),
    );
    setState(() {});
  }

  final double inputMargins = 25;

  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'O nome é obrigatório';
    }

    if (name.length < 3) {
      return 'O nome da senha é muito curto';
    }

    return null;
  }

  void sendForm() {
    if (_formKey.currentState!.validate()) {
      passwordForm["name"] = nameController.value.text;
      passwordForm["login"] = loginController.value.text;
      passwordForm["password"] = passwordController.value.text;
      passwordForm["url"] = urlController.value.text;
      passwordForm["description"] = descriptionController.value.text;

      print(passwordForm);
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Salvando, aguarde...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nome da Senha:"),
            TextFormField(
              controller: nameController,
              validator: validateName,
            ),
            SizedBox(height: inputMargins),
            const Text("Insira o Login"),
            TextFormField(
              controller: loginController,
            ),
            SizedBox(height: inputMargins),
            const Text("Insira a Senha"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isShowingPassword,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isShowingPassword = !isShowingPassword;
                    });
                  },
                  child: Icon(!isShowingPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                )
              ],
            ),
            SizedBox(height: inputMargins),
            const Text("Insira a URL"),
            renderUrlInput(),
            SizedBox(height: inputMargins),
            const Text("Descrição"),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              controller: descriptionController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: HexColor(Constants.winkleBG),
                  minimumSize: const Size.fromHeight(45),
                ),
                onPressed: sendForm,
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
