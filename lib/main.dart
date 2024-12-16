import 'package:flame/game.dart';
import 'package:flappy_bird/flappy_ship_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Orbitron'),
      home: GameWidget(game: FlappyShipGame()),
    );
  }
}