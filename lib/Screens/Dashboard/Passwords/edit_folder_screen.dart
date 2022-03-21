import 'package:flutter/material.dart';
import 'package:winkle/Components/Dashboard/Passwords/folder_form.dart';

import '../../../Components/hex_color.dart';
import '../../../constants.dart';

class EditFolderScreen extends StatelessWidget {
  static const routeName = '/edit-folder-screen';
  const EditFolderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: HexColor(Constants.winkleDark),
        title: const Text("Editar categoria"),
      ),
      body: const FolderForm(),
    );
  }
}
