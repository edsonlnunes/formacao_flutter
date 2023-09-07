import 'package:flutter/material.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: "By signing up, you agree to our ",
        children: [
          TextSpan(
            text: "Terms of Service",
            style: TextStyle(
              color: Colors.green,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: " and acknowledge that our ",
          ),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              color: Colors.green,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: " applies to you.",
          )
        ],
      ),
    );
  }
}
