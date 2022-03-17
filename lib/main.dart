import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/masterpassword_screen.dart';
import './Screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const WelcomeScreen(),
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        MasterPasswordScreen.routeName: (context) => MasterPasswordScreen(),
      },
    );
  }
}
