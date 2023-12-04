import 'package:flutter/material.dart';

class ErrorSettingsMap extends StatelessWidget {
  final String textError;
  final String textButton;
  final void Function() onPressed;

  const ErrorSettingsMap({
    Key? key,
    required this.textButton,
    required this.textError,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textError,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: onPressed,
              child: Text(textButton),
            )
          ],
        ),
      ),
    );
  }
}
