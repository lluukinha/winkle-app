import 'package:flutter/material.dart';
import '../Screens/masterpassword_screen.dart';

class Login extends StatelessWidget {
  final VoidCallback toggleLogin;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Login(this.toggleLogin, {Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
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
}
