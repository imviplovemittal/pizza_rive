import 'dart:math';

import 'package:flare_flutter/base/animation/actor_animation.dart';
import 'package:flare_flutter/base/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';

class SmileyController extends FlareController {
  ActorAnimation? _blink;
  double timer = 0;
  Random random = Random();

  @override
  void initialize(FlutterActorArtboard artboard) {
    _blink = artboard.getAnimation('blink');
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    timer = timer + elapsed;
    _blink!.apply(timer % 2, artboard, 0.5);
    return true;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
    // TODO: implement setViewTransform
  }
  
}