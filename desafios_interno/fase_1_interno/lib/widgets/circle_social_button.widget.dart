import 'package:flutter/material.dart';

class CircleSocialButton extends StatelessWidget {
  final String asset;
  const CircleSocialButton({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          asset,
          width: 35,
        ),
      ),
    );
  }
}
