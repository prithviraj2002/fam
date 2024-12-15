import 'package:fam/domain/model/hc5_model.dart';
import 'package:flutter/material.dart';

class Hc5Card extends StatelessWidget {
  final HC5Cards? card;
  final double height;

  const Hc5Card({required this.card, this.height = 60, super.key});

  @override
  Widget build(BuildContext context) {
    String bgImage = "";
    double aspectRatio = 0.0;
    if (card!.bgImage != null && card!.bgImage!.imageUrl != null) {
      bgImage = card!.bgImage!.imageUrl!;
    }
    if (card!.bgImage != null && card!.bgImage!.aspectRatio != null) {
      aspectRatio = card!.bgImage!.aspectRatio!;
    }
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child:
          AspectRatio(aspectRatio: aspectRatio, child: Image.network(bgImage)),
    );
  }
}
