import 'package:flutter/material.dart';
import 'package:winkle/Components/Dashboard/Passwords/folder_form.dart';

import '../../../Components/hex_color.dart';
import '../../../constants.dart';

class CreateFolderScreen extends StatelessWidget {
  static const routeName = '/create-folder-screen';
  const CreateFolderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: HexColor(Constants.winkleDark),
        title: const Text("Nova categoria"),
      ),
      body: const FolderForm(),
    );
  }
}
