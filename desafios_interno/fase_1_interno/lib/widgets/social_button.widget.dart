import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String asset;
  final String text;
  const SocialButton({
    super.key,
    required this.asset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(60),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(60),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Image.asset(
              asset,
              width: 20,
            ),
            Expanded(
              child: Align(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
