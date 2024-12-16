import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/flappy_ship_game.dart';
import 'package:flutter/material.dart';

class Score extends TextComponent with HasGameRef<FlappyShipGame> {
  Score()
      : super(
          text: '0',
          textRenderer: TextPaint(
            style: TextStyle(
              fontFamily: 'Orbitron',
              fontWeight: FontWeight.bold,
              color: Colors.yellow.shade700,
              fontSize: 52.0,
            ),
          ),
        );

  @override
  FutureOr<void> onLoad() {
    position = Vector2(
      (gameRef.size.x - size.x) / 2,
      gameRef.size.y - size.y - 25,
    );
  }

  @override
  void update(double dt) {
    final newText = gameRef.score.toString();
    if (text != newText) {
      text = newText;
      FlameAudio.play('scoreUp.wav', volume: 0.5);
    }
  }
}
