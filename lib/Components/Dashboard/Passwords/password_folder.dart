import 'package:flutter/material.dart';
import 'package:winkle/Components/Dashboard/Passwords/password_card.dart';
import 'package:winkle/Screens/Dashboard/Passwords/edit_folder_screen.dart';

class PasswordFolder extends StatefulWidget {
  const PasswordFolder({Key? key}) : super(key: key);

  @override
  State<PasswordFolder> createState() => _PasswordFolderState();
}

class _PasswordFolderState extends State<PasswordFolder> {
  bool isShowingPasswords = false;

  void togglePasswords() {
    setState(() {
      isShowingPasswords = !isShowingPasswords;
    });
  }

  IconData toggleFolderIcon() {
    return isShowingPasswords ? Icons.arrow_downward : Icons.chevron_right;
  }

  final double folderTextSize = 18.0;
  final double spaceBetweenIcons = 10;

  ButtonStyle folderButtonStyle() {
    return TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: [
            ListTile(
              leading: TextButton(
                style: folderButtonStyle(),
                onPressed: togglePasswords,
                child: Icon(toggleFolderIcon()),
              ),
              title: Text("Folder name (0)",
                  style: TextStyle(fontSize: folderTextSize)),
              dense: true,
              trailing: TextButton(
                  style: folderButtonStyle(),
                  onPressed: () {
                    Navigator.pushNamed(context, EditFolderScreen.routeName);
                  },
                  child: const Icon(Icons.create)),
            ),
            Visibility(
                visible: isShowingPasswords,
                child: Column(
                  children: const [
                    PasswordCard(),
                    PasswordCard(),
                  ],
                ))
          ],
        ));
  }
}
