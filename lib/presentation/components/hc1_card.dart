import 'package:fam/domain/model/hc1_model.dart';
import 'package:fam/presentation/utils/utils.dart';
import 'package:flutter/material.dart';

class Hc1Card extends StatelessWidget {
  final HC1Cards? card;
  final double height;
  final double width;

  const Hc1Card(
      {required this.card, this.height = 64, this.width = 0.0, super.key});

  @override
  Widget build(BuildContext context) {
    String bgImage = "";
    double aspectRatio = 0.0;
    Color bgColor = Colors.white;
    String titleEntity = "";
    String descEntity = "";
    Color titleEntityColor = Colors.white;
    Color descEntityColor = Colors.white;
    FontWeight titleFontWeight = FontWeight.w200;
    FontWeight descFontWeight = FontWeight.w200;
    if (card!.icon!.imageUrl != null && card!.icon!.aspectRatio != null) {
      bgImage = card!.icon!.imageUrl!;
      aspectRatio = double.parse(card!.icon!.aspectRatio!.toString());
    }
    if (card!.bgColor != null) {
      bgColor = Utils.hexToColor(card!.bgColor!);
    }
    if (card!.formattedTitle != null &&
        card!.formattedTitle!.entities != null) {
      for (HC1CardsFormattedTitleEntities? entity
          in card!.formattedTitle!.entities!) {
        if (entity != null) {
          titleEntity += "${entity.text} ";
          titleEntityColor = Utils.hexToColor(entity.color!);
          titleFontWeight = Utils.getFontWeight(entity.fontFamily!);
        }
      }
    }
    if (card!.formattedDescription != null &&
        card!.formattedDescription!.entities != null) {
      for (HC1CardsFormattedDescriptionEntities? entity
          in card!.formattedDescription!.entities!) {
        if (entity != null) {
          descEntity += "${entity.text} ";
          descEntityColor = Utils.hexToColor(entity.color!);
          descFontWeight = Utils.getFontWeight(entity.fontFamily!);
        }
      }
    }
    return Container(
      height: height,
      width: width == 0.0 ? MediaQuery.of(context).size.width * 0.96 : width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: bgColor),
      child: ListTile(
        leading: AspectRatio(
            aspectRatio: aspectRatio, child: Image.network(bgImage)),
        title: Text(
          titleEntity,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              TextStyle(color: titleEntityColor, fontWeight: titleFontWeight),
        ),
        subtitle: Text(
          descEntity,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: descEntityColor, fontWeight: descFontWeight),
        ),
      ),
    );
  }
}
