import 'package:flutter/material.dart';
import 'package:winkle/Screens/welcome_screen.dart';
import '../constants.dart';
import '../Components/hex_color.dart';

class MasterPasswordScreen extends StatelessWidget {
  static const routeName = '/dashboard-screen';

  final masterPasswordController = TextEditingController();

  MasterPasswordScreen({Key? key}) : super(key: key);

  Widget backButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.popUntil(
          context, ModalRoute.withName(WelcomeScreen.routeName)),
      child: const Text(
        "(Sair)",
        style: TextStyle(
            fontSize: 14, fontStyle: FontStyle.italic, color: Colors.white60),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(HexColor(Constants.winkleBG)),
      ),
    );
  }

  Widget leaveButton(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Olá Fulano",
            style: TextStyle(
                fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white),
          ),
          backButton(context)
        ]);
  }

  Widget inputMasterPassword() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: TextField(
          controller: masterPasswordController,
          decoration: const InputDecoration(
            hintText: "Insira aqui a senha mestre",
            hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }

  Widget enterButton(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.indigo.shade800),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MasterPasswordScreen()),
          );
        },
        child: const Text(
          'Entrar',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            backgroundColor: HexColor(Constants.winkleBG),
            body: Stack(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      leaveButton(context),
                      inputMasterPassword(),
                      enterButton(context)
                    ],
                  ),
                )
              ])
            ])));
  }
}
