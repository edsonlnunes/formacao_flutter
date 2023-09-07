import 'package:flutter/material.dart';

class ResultQuiz extends StatelessWidget {
  final int score;
  const ResultQuiz({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "O quiz acabou. Você fez $score ponto(s)",
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Voltar",
            ),
          )
        ],
      ),
    );
  }
}
