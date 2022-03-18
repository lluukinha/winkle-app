import 'package:flutter/material.dart';
import 'package:winkle/Screens/Dashboard/password_screen.dart';
import 'package:winkle/Screens/masterpassword_screen.dart';

import '../Components/hex_color.dart';
import '../constants.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard-screen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

Route _masterRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        MasterPasswordScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  List<String> titles = ["Senhas", "Meus dados"];

  void changeIndex(int newIndex) {
    if (newIndex == 2) {
      Navigator.of(context).push(_masterRoute());
      return;
    }

    setState(() {
      _currentIndex = newIndex;
    });

    pageController.animateToPage(newIndex,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  void changePage(int newPageIndex) {
    setState(() {
      _currentIndex = newPageIndex;
    });
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: HexColor(Constants.winkleBG),
          appBar: AppBar(
            backgroundColor: HexColor("#111827"),
            title: Text(titles[_currentIndex]),
            automaticallyImplyLeading: false,
            actions: [
              Visibility(
                  visible: _currentIndex == 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ))
            ],
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: changePage,
            children: [
              const PasswordScreen(),
              Container(color: Colors.yellow),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: HexColor("#111827"),
              unselectedItemColor: Colors.white38,
              selectedItemColor: Colors.white,
              // selectedFontSize: 16,
              // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              onTap: changeIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.key), label: 'Senhas'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Meus dados'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.lock), label: 'Bloquear Tela')
              ],
              currentIndex: _currentIndex),
        ));
  }
}