import 'package:flutter/material.dart';
import 'package:winkle/Screens/Dashboard/Passwords/create_folder_screen.dart';
import 'package:winkle/Screens/Dashboard/Passwords/password_screen.dart';
import 'package:winkle/Screens/masterpassword_screen.dart';

import '../Components/hex_color.dart';
import '../constants.dart';
import 'Dashboard/Passwords/create_password_screen.dart';

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
  bool isCreating = false;
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

  void setCreation(bool newValue) {
    setState(() {
      isCreating = newValue;
    });
  }

  Widget renderFloatingAction() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: isCreating,
            child: FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  Navigator.pushNamed(context, CreatePasswordScreen.routeName);
                },
                backgroundColor: HexColor(Constants.winkleBG),
                icon: const Icon(Icons.key),
                label: const Text('Nova senha')),
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: isCreating,
            child: FloatingActionButton.extended(
              icon: const Icon(Icons.create_new_folder),
              label: const Text("Nova categoria"),
              onPressed: () =>
                  {Navigator.pushNamed(context, CreateFolderScreen.routeName)},
              backgroundColor: HexColor(Constants.winkleBG),
              heroTag: null,
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.add),
              backgroundColor: HexColor(Constants.winkleBG),
              onPressed: () => setCreation(!isCreating))
        ]);
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            backgroundColor: HexColor(Constants.winkleDark),
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
          body: GestureDetector(
              onTap: () => setCreation(false),
              child: PageView(
                controller: pageController,
                onPageChanged: changePage,
                children: [
                  const PasswordScreen(),
                  Container(color: Colors.yellow),
                ],
              )),
          floatingActionButton: Visibility(
              visible: _currentIndex == 0, child: renderFloatingAction()),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: HexColor(Constants.winkleDark),
              unselectedItemColor: Colors.white38,
              selectedItemColor: Colors.white,
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
