import 'package:flutter/material.dart';

import '../widgets/custom_button.widget.dart';
import '../widgets/social_button.widget.dart';
import '../widgets/terms_and_privacy.widget.dart';

class HomeTwitterPage extends StatelessWidget {
  const HomeTwitterPage({super.key});

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
            children: [
              Image.asset(
                "assets/images/twitter.png",
                width: 30,
                height: 30,
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "See what's happening in the world right now",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SocialButton(
                pathImage: "assets/images/facebook.png",
                text: "Continue with Facebook",
              ),
              const SizedBox(
                height: 15,
              ),
              const SocialButton(
                pathImage: "assets/images/google.png",
                text: "Continue with Google",
              ),
              const SizedBox(
                height: 15,
              ),
              const SocialButton(
                pathImage: "assets/images/apple.png",
                text: "Continue with Apple",
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or"),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomButton(
                text: "Create account",
              ),
              const SizedBox(
                height: 30,
              ),
              const TermsAndPrivacy(),
              const SizedBox(
                height: 50,
              ),
              RichText(
                text: const TextSpan(
                  text: "Have an account already? ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Log in",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
