import 'package:flutter/material.dart';

class EndGameWidget extends StatelessWidget {
  const EndGameWidget({
    super.key,
    required this.score,
    required this.reset,
  });

  final int score;

  final void Function() reset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/game_over.png',
              width: 200.0,
            ),
            const SizedBox(height: 28.0),
            Text(
              'Pontuação',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.yellow.shade700,
              ),
            ),
            Text(
              '$score',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.yellow.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18.0),
            FilledButton(
              child: const Text('Tentar novamente'),
              onPressed: () {
                Navigator.pop(context);

                reset();
              },
            ),
          ],
        ),
      ),
    );
  }
}
