import 'package:flutter/material.dart';
import 'package:winkle/Components/Dashboard/Passwords/password_folder.dart';

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
      margin: const EdgeInsets.only(top: 20),
      child: ListView(
        children: const [
          PasswordFolder(),
          PasswordFolder(),
          PasswordFolder(),
          PasswordFolder()
        ],
      ),
    );
  }
}
