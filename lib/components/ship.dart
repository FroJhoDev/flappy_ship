import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/flappy_ship_game.dart';

class Ship extends SpriteComponent with CollisionCallbacks {
  Ship()
      : super(
          position: Vector2(birdStartX, birdStartY),
          size: Vector2(birdWidth, birdHeight),
        );

  double velocity = 0;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('ship.png');

    add(RectangleHitbox());
  }

  void flap() {
    velocity = jumpStrength;
    FlameAudio.play('proportion.wav');
  }

  @override
  void update(double dt) {
    velocity += gravity * dt;

    position.y += velocity * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Ground) {
      (parent as FlappyShipGame).gameOver();
      FlameAudio.play('hit.wav');
    }

    if (other is Pipe) {
      (parent as FlappyShipGame).gameOver();
      FlameAudio.play('hit.wav');
    }
  }
}
