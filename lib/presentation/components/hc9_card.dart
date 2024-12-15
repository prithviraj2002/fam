import 'dart:math';

import 'package:fam/domain/model/hc9_model.dart';
import 'package:fam/presentation/utils/utils.dart';
import 'package:flutter/material.dart';

class Hc9Card extends StatelessWidget {
  final HC9Cards? card;
  final double height;

  const Hc9Card({required this.card, this.height = 195, super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [];
    double angle = 333;
    String bgImage = "";
    double aspectRatio = 0.0;
    if (card!.bgGradient != null && card!.bgGradient!.colors != null) {
      for (String? hex in card!.bgGradient!.colors!) {
        gradientColors.add(Utils.hexToColor(hex!));
      }
    }
    if (card!.bgGradient != null && card!.bgGradient!.angle != null) {
      angle = double.parse(card!.bgGradient!.angle!.toString());
    }
    if (card!.bgImage != null && card!.bgImage!.imageUrl != null) {
      bgImage = card!.bgImage!.imageUrl!;
    }
    if (card!.bgImage != null && card!.bgImage!.aspectRatio != null) {
      aspectRatio = card!.bgImage!.aspectRatio!;
    }
    return Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment(
              cos(Utils.angleToRadians(angle)),
              sin(Utils.angleToRadians(angle)),
            ),
            end: Alignment(
              cos(Utils.angleToRadians(angle + 180)),
              sin(Utils.angleToRadians(angle + 180)),
            ),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: AspectRatio(
            aspectRatio: aspectRatio, child: Image.network(bgImage)));
  }
}
