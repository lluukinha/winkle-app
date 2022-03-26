import 'package:flutter/material.dart';
import 'package:winkle/Components/Dashboard/Passwords/password_form.dart';

import '../../../Components/hex_color.dart';
import '../../../constants.dart';

class CreatePasswordScreen extends StatelessWidget {
  static const routeName = '/create-password-screen';
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: HexColor(Constants.winkleDark),
        title: const Text("Nova senha"),
      ),
      body: PasswordForm(),
    );
  }
}
