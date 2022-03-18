import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Components/hex_color.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Components/login.dart';
import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';
  static void toggleLogin() {
    _WelcomeScreenState().toggleLogin();
  }

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isShowingLogin = false;

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
                        child: Stack(children: [Login(toggleLogin)]),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
