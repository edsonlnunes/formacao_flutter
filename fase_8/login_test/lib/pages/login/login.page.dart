import 'package:flutter/material.dart';
import 'package:login_test/pages/home.page.dart';
import 'package:login_test/pages/login/login.store.dart';

import '../../widgets/login_button.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = LoginStore();

  void navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create an account or sign in to save and see your conversation history.",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              LoginButton(
                pathImage: "assets/images/google.png",
                text: "Continue with Google",
                onPressed: () async {
                  await store.signInWithGoogle();
                  navigateToHome();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              LoginButton(
                pathImage: "assets/images/facebook.png",
                text: "Continue with Facebook",
                onPressed: () async {
                  await store.signInWithFacebook();
                  navigateToHome();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              LoginButton(
                pathImage: "assets/images/apple.png",
                text: "Continue with Apple",
                onPressed: () {},
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "or",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              LoginButton(
                icon: Icons.phone_iphone,
                text: "Use phone number",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
