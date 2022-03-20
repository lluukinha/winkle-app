import 'package:flutter/material.dart';
import 'package:winkle/Components/Dashboard/Passwords/password_card.dart';

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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      TextButton(
                          style: folderButtonStyle(),
                          onPressed: togglePasswords,
                          child: Icon(toggleFolderIcon())),
                      SizedBox(width: spaceBetweenIcons),
                      Expanded(
                          child: Text(
                        'Nome da categoria grande demais da conta',
                        style: TextStyle(fontSize: folderTextSize),
                        overflow: TextOverflow.ellipsis,
                      )),
                      Text('(0)', style: TextStyle(fontSize: folderTextSize)),
                    ])),
                SizedBox(width: spaceBetweenIcons),
                TextButton(
                    style: folderButtonStyle(),
                    onPressed: null,
                    child: const Icon(Icons.delete))
              ],
            ),
            const SizedBox(height: 10),
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
