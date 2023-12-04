import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_test/pages/home.page.dart';

import '../widgets/custom_button.widget.dart';
import '../widgets/social_button.widget.dart';
import '../widgets/terms_and_privacy.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status != LoginStatus.success) {
      throw "Erro ao fazer login";
    }

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    final user = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    print(user.additionalUserInfo?.username);

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final user = await FirebaseAuth.instance.signInWithCredential(credential);

    if (!mounted) return;

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
              SocialButton(
                pathImage: "assets/images/facebook.png",
                text: "Continue with Facebook",
                onPressed: signInWithFacebook,
              ),
              const SizedBox(
                height: 15,
              ),
              SocialButton(
                pathImage: "assets/images/google.png",
                text: "Continue with Google",
                onPressed: signInWithGoogle,
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
