import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winkle/Screens/masterpassword_screen.dart';
import '../Components/hex_color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isShowingLogin = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void toggleLogin() {
    setState(() {
      _isShowingLogin = !_isShowingLogin;
    });
  }

  void launchURL() async {
    String url = "https://www.winkle.com.br";
    if (!await launch(url)) throw 'Could not launch $url';
  }

  Widget authentificationButton(Color buttonColor, String title,
      Color textColor, BuildContext ctx, VoidCallback callback) {
    return Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
        child: ElevatedButton(
          onPressed: callback,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(buttonColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23)))),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ));
  }

  Widget userInput(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade300,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: TextField(
          controller: userInput,
          decoration: InputDecoration(
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontStyle: FontStyle.italic),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget loginForm() {
    return Container(
      height: 420,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text('Login',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(height: 10),
            userInput(emailController, 'Email', TextInputType.emailAddress),
            userInput(
                passwordController, 'Senha', TextInputType.visiblePassword),
            Container(
              height: 55,
              padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigo.shade800),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)))),
                onPressed: () {
                  print(emailController);
                  print(passwordController);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MasterPasswordScreen()),
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
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text('Esqueceu a senha?'),
            ),
            const Divider(thickness: 0, color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Não tem uma conta ainda?',
                  style: TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic),
                ),
                TextButton(
                  onPressed: toggleLogin,
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
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
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                                height: 200,
                                image: NetworkImage(
                                    'https://www.winkle.app/assets/logo-white.2cf3acf2.png')),
                            Text(
                              "Winkle",
                              style: TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Gerenciador de Senhas',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: !_isShowingLogin,
                          child: Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                authentificationButton(Colors.indigo, 'Entrar',
                                    Colors.white, context, toggleLogin),
                                authentificationButton(
                                    Colors.white,
                                    'Cadastrar',
                                    Colors.lightBlue,
                                    context,
                                    launchURL),
                              ],
                            ),
                          )),
                      Visibility(
                        visible: _isShowingLogin,
                        child: Stack(children: [loginForm()]),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
