import 'dart:async';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/components/components.dart';

class FlappyShipGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Ship ship;
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;
  late Score scoreText;

  @override
  FutureOr<void> onLoad() {
    background = Background(size);
    add(background);

    ship = Ship();
    add(ship);

    ground = Ground();
    add(ground);

    pipeManager = PipeManager();
    add(pipeManager);

    scoreText = Score();
    add(scoreText);
  }

  @override
  void onTap() {
    ship.flap();
  }

  int score = 0;

  void incrementScore() {
    score += 1;
  }

  bool isGameOver = false;

  void gameOver() {
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();

    showDialog(
      context: buildContext!,
      barrierDismissible: false,
      builder: (context) => EndGameWidget(score: score, reset: reset),
    );
  }

  void reset() {
    ship.position = Vector2(birdStartX, birdStartY);
    ship.velocity = 0;
    score = 0;
    isGameOver = false;
    children.whereType<Pipe>().forEach((pipe) => pipe.removeFromParent());
    resumeEngine();
  }
}
