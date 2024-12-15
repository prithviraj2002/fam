import 'package:cached_network_image/cached_network_image.dart';
import 'package:fam/domain/big_card_cubit/big_card_cubit.dart';
import 'package:fam/domain/model/hc3_model.dart';
import 'package:fam/presentation/utils/assets.dart';
import 'package:fam/presentation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Hc3Card extends StatefulWidget {
  final HC3Cards? card;
  final double height;
  final BigCardCubit cubit;

  const Hc3Card(
      {required this.card, this.height = 600, required this.cubit, super.key});

  @override
  State<Hc3Card> createState() => _Hc3CardState();
}

class _Hc3CardState extends State<Hc3Card> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    String imageUrl = "";
    double aspectRatio = 0.0;
    List<String> titleEntity = [];
    List<Color> titleEntityColors = [];
    List<FontWeight> titleFontWeight = [];
    List<int> fontSize = [];
    String ctaText = "";
    String ctaColor = "";
    String url = "";
    if (widget.card!.bgImage != null &&
        widget.card!.bgImage!.imageUrl != null) {
      imageUrl = widget.card!.bgImage!.imageUrl!;
    }
    if (widget.card!.bgImage != null &&
        widget.card!.bgImage!.aspectRatio != null) {
      aspectRatio = widget.card!.bgImage!.aspectRatio!;
    }
    if (widget.card!.formattedTitle != null &&
        widget.card!.formattedTitle!.entities != null) {
      for (HC3CardsFormattedTitleEntities? entity
          in widget.card!.formattedTitle!.entities!) {
        if (entity != null) {
          titleEntity.add(entity.text!);
          titleEntityColors.add(Utils.hexToColor(entity.color!));
          titleFontWeight.add(Utils.getFontWeight(entity.fontFamily!));
          fontSize.add(entity.fontSize!);
        }
      }
    }
    if (widget.card!.cta != null &&
        widget.card!.cta!.isNotEmpty &&
        widget.card!.cta!.first!.bgColor != null) {
      ctaText = widget.card!.cta!.first!.text!;
      ctaColor = widget.card!.cta!.first!.bgColor!;
    }
    if (widget.card!.url != null) {
      url = widget.card!.url!;
    }
    return Container(
      height: widget.height,
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.96,
      child: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: widget.height,
            width: MediaQuery.of(context).size.width * 0.96,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    widget.cubit.toggleVisibility();
                  },
                  child: Container(
                    height: 64,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffF7F6F3)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.bellSvg),
                        const SizedBox(height: 4),
                        const Text(
                          "remind later",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    widget.cubit.hidePermanently();
                  },
                  child: Container(
                    height: 64,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffF7F6F3)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.dismissSvg),
                        const SizedBox(height: 4),
                        const Text(
                          "dismiss now",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          left: isCollapsed ? MediaQuery.of(context).size.width * 0.5 : 0,
          child: InkWell(
            onLongPress: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: Container(
              height: widget.height,
              width: MediaQuery.of(context).size.width * 0.96,
              decoration: BoxDecoration(
                  color: const Color(0xff454AA6),
                  borderRadius: BorderRadius.circular(12)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: isCollapsed
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width * 0.96,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    SizedBox(
                      height: widget.height / 2,
                      child: AspectRatio(
                        aspectRatio: aspectRatio,
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: widget.height / 2,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Text(
                      titleEntity.first,
                      style: TextStyle(
                          color: titleEntityColors.first,
                          fontWeight: titleFontWeight.first,
                          fontSize: double.parse(fontSize.first.toString())),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      titleEntity.last,
                      style: TextStyle(
                          color: titleEntityColors.last,
                          fontWeight: titleFontWeight.last,
                          fontSize: double.parse(fontSize.last.toString())),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(url));
                      },
                      child: Container(
                        height: 42,
                        width: 128,
                        decoration: BoxDecoration(
                            color: Utils.hexToColor(ctaColor),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                            child: Text(
                          ctaText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
