import 'package:flutter/material.dart';
import 'package:winkle/Components/Dashboard/Passwords/password_folder.dart';

class PasswordScreen extends StatefulWidget {
  static const routeName = '/dashboard-screen';

  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            textAlign: TextAlign.center,
            controller: searchController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search),
              hintText: 'Pesquise aqui',
              hintStyle: const TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: const EdgeInsets.all(10),
              fillColor: Colors.grey.shade200,
            ),
          ),
        ),
        const PasswordFolder(),
        const PasswordFolder(),
        const PasswordFolder(),
        const PasswordFolder()
      ],
    );
  }
}
