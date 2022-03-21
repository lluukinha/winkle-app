import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winkle/Screens/Dashboard/Passwords/create_folder_screen.dart';
import 'package:winkle/Screens/dashboard_screen.dart';
import 'Screens/Dashboard/Passwords/create_password_screen.dart';
import 'Screens/Dashboard/Passwords/edit_folder_screen.dart';
import 'Screens/Dashboard/Passwords/edit_password_screen.dart';
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
        DashboardScreen.routeName: (context) => const DashboardScreen(),
        CreateFolderScreen.routeName: (context) => const CreateFolderScreen(),
        EditFolderScreen.routeName: (context) => const EditFolderScreen(),
        CreatePasswordScreen.routeName: (context) =>
            const CreatePasswordScreen(),
        EditPasswordScreen.routeName: (context) => const EditPasswordScreen()
      },
    );
  }
}
