import 'package:clone_home_medium/widgets/circle_social_button.widget.dart';
import 'package:clone_home_medium/widgets/social_button.widget.dart';
import 'package:clone_home_medium/widgets/terms_and_privacy.widget.dart';
import 'package:flutter/material.dart';

class HomeMediumPage extends StatelessWidget {
  const HomeMediumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/medium.png",
                    key: const ValueKey("imageMedium"),
                    width: 240,
                  ),
                ),
              ),
              const Text(
                "Join Medium.",
                key: ValueKey("textTitle"),
                style: TextStyle(
                  fontSize: 44,
                ),
              ),
              const SizedBox(height: 40),
              const SocialButton(
                key: ValueKey("signupGoogle"),
                asset: "assets/images/google.png",
                text: "Sign up with Google",
              ),
              const SizedBox(height: 15),
              const SocialButton(
                key: ValueKey("signupEmail"),
                asset: "assets/images/email.png",
                text: "Sign up with Email",
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      key: ValueKey("dividerLeft"),
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Or, sign up with"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(
                      key: ValueKey("dividerRight"),
                      thickness: 1,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const CircleSocialButton(
                key: ValueKey("buttonFacebook"),
                asset: "assets/images/facebook.png",
              ),
              const SizedBox(
                height: 40,
              ),
              const Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  children: [
                    TextSpan(
                      text: "Sign in",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TermsAndPrivacy(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
