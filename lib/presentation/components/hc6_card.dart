import 'package:fam/domain/model/hc6_model.dart';
import 'package:fam/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hc6Card extends StatelessWidget {
  final HC6Cards? card;
  final double height;

  const Hc6Card({required this.card, this.height = 60, super.key});

  @override
  Widget build(BuildContext context) {
    String bgColor = "";
    String bgImage = "";
    double aspectRatio = 0.0;
    double iconSize = 16;
    String url = "";
    String titleEntity = "";
    Color titleEntityColor = Colors.white;
    FontWeight titleFontWeight = FontWeight.w200;
    if (card!.bgColor != null) {
      bgColor = card!.bgColor!;
    }
    if (card!.icon != null &&
        card!.icon!.imageUrl != null &&
        card!.icon!.aspectRatio != null) {
      bgImage = card!.icon!.imageUrl!;
      aspectRatio = double.parse(card!.icon!.aspectRatio!.toString());
    }
    if (card!.iconSize != null) {
      iconSize = double.parse(card!.iconSize!.toString());
    }
    if (card!.url != null) {
      url = card!.url!;
    }
    if (card!.formattedTitle != null &&
        card!.formattedTitle!.entities != null) {
      for (HC6CardsFormattedTitleEntities? entity
          in card!.formattedTitle!.entities!) {
        if (entity != null) {
          titleEntity += "${entity.text} ";
          titleEntityColor = Utils.hexToColor(entity.color!);
          titleFontWeight = Utils.getFontWeight(entity.fontFamily!);
        }
      }
    }
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(url));
      },
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width * 0.96,
        decoration: BoxDecoration(
          color: Utils.hexToColor(bgColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: ListTile(
            leading: SizedBox(
              height: iconSize,
              width: iconSize,
              child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Image.network(
                    bgImage,
                    fit: BoxFit.cover,
                  )),
            ),
            title: Text(
              titleEntity,
              style: TextStyle(
                  color: titleEntityColor, fontWeight: titleFontWeight),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
