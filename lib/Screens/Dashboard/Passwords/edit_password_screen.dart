import 'package:flutter/material.dart';
import 'package:winkle/Components/Dashboard/Passwords/password_form.dart';

import '../../../Components/hex_color.dart';
import '../../../constants.dart';

class EditPasswordScreen extends StatelessWidget {
  static const routeName = '/edit-password-screen';
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: HexColor(Constants.winkleDark),
        title: const Text("Editar senha"),
      ),
      body: const PasswordForm(),
    );
  }
}
