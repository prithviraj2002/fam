import 'package:fam/domain/model/card_model.dart';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class HC6CardsIcon {
/*
{
  "image_type": "ext",
  "image_url": "https://westeros.r2.famapp.xyz/media/images/generic/7d566650409c4a289957b030c3fee111.png",
  "webp_image_url": "https://westeros.r2.famapp.xyz/media/images/generic/7d566650409c4a289957b030c3fee111.png.webp",
  "aspect_ratio": 1
}
*/

  String? imageType;
  String? imageUrl;
  String? webpImageUrl;
  int? aspectRatio;

  HC6CardsIcon({
    this.imageType,
    this.imageUrl,
    this.webpImageUrl,
    this.aspectRatio,
  });
  HC6CardsIcon.fromJson(Map<String, dynamic> json) {
    imageType = json['image_type']?.toString();
    imageUrl = json['image_url']?.toString();
    webpImageUrl = json['webp_image_url']?.toString();
    aspectRatio = json['aspect_ratio']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image_type'] = imageType;
    data['image_url'] = imageUrl;
    data['webp_image_url'] = webpImageUrl;
    data['aspect_ratio'] = aspectRatio;
    return data;
  }
}

class HC6CardsFormattedTitleEntities {
/*
{
  "text": "Small card with an arrow ",
  "type": "generic_text",
  "color": "#000000",
  "font_style": "underline",
  "font_family": "met_semi_bold"
}
*/

  String? text;
  String? type;
  String? color;
  String? fontStyle;
  String? fontFamily;

  HC6CardsFormattedTitleEntities({
    this.text,
    this.type,
    this.color,
    this.fontStyle,
    this.fontFamily,
  });
  HC6CardsFormattedTitleEntities.fromJson(Map<String, dynamic> json) {
    text = json['text']?.toString();
    type = json['type']?.toString();
    color = json['color']?.toString();
    fontStyle = json['font_style']?.toString();
    fontFamily = json['font_family']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['type'] = type;
    data['color'] = color;
    data['font_style'] = fontStyle;
    data['font_family'] = fontFamily;
    return data;
  }
}

class HC6CardsFormattedTitle {
/*
{
  "text": " ",
  "align": "left",
  "entities": [
    {
      "text": "Small card with an arrow ",
      "type": "generic_text",
      "color": "#000000",
      "font_style": "underline",
      "font_family": "met_semi_bold"
    }
  ]
}
*/

  String? text;
  String? align;
  List<HC6CardsFormattedTitleEntities?>? entities;

  HC6CardsFormattedTitle({
    this.text,
    this.align,
    this.entities,
  });
  HC6CardsFormattedTitle.fromJson(Map<String, dynamic> json) {
    text = json['text']?.toString();
    align = json['align']?.toString();
    if (json['entities'] != null) {
      final v = json['entities'];
      final arr0 = <HC6CardsFormattedTitleEntities>[];
      v.forEach((v) {
        arr0.add(HC6CardsFormattedTitleEntities.fromJson(v));
      });
      entities = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['align'] = align;
    if (entities != null) {
      final v = entities;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['entities'] = arr0;
    }
    return data;
  }
}

class HC6Cards{
/*
{
  "id": 3,
  "name": "smallCardWithArrow",
  "slug": "smallCardWithArrow",
  "title": " ",
  "formatted_title": {
    "text": " ",
    "align": "left",
    "entities": [
      {
        "text": "Small card with an arrow ",
        "type": "generic_text",
        "color": "#000000",
        "font_style": "underline",
        "font_family": "met_semi_bold"
      }
    ]
  },
  "icon": {
    "image_type": "ext",
    "image_url": "https://westeros.r2.famapp.xyz/media/images/generic/7d566650409c4a289957b030c3fee111.png",
    "webp_image_url": "https://westeros.r2.famapp.xyz/media/images/generic/7d566650409c4a289957b030c3fee111.png.webp",
    "aspect_ratio": 1
  },
  "positional_images": [
    null
  ],
  "components": [
    null
  ],
  "url": "fp://fampay.in/pay/",
  "bg_color": "#FBAF03",
  "icon_size": 16,
  "is_disabled": false,
  "is_shareable": false,
  "is_internal": false
}
*/

  int? id;
  String? name;
  String? slug;
  String? title;
  HC6CardsFormattedTitle? formattedTitle;
  HC6CardsIcon? icon;
  List<dynamic>? positionalImages;
  List<dynamic>? components;
  String? url;
  String? bgColor;
  int? iconSize;
  bool? isDisabled;
  bool? isShareable;
  bool? isInternal;

  HC6Cards({
    this.id,
    this.name,
    this.slug,
    this.title,
    this.formattedTitle,
    this.icon,
    this.positionalImages,
    this.components,
    this.url,
    this.bgColor,
    this.iconSize,
    this.isDisabled,
    this.isShareable,
    this.isInternal,
  });
  HC6Cards.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    title = json['title']?.toString();
    formattedTitle = (json['formatted_title'] != null) ? HC6CardsFormattedTitle.fromJson(json['formatted_title']) : null;
    icon = (json['icon'] != null) ? HC6CardsIcon.fromJson(json['icon']) : null;
    url = json['url']?.toString();
    bgColor = json['bg_color']?.toString();
    iconSize = json['icon_size']?.toInt();
    isDisabled = json['is_disabled'];
    isShareable = json['is_shareable'];
    isInternal = json['is_internal'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['title'] = title;
    if (formattedTitle != null) {
      data['formatted_title'] = formattedTitle!.toJson();
    }
    if (icon != null) {
      data['icon'] = icon!.toJson();
    }
    data['url'] = url;
    data['bg_color'] = bgColor;
    data['icon_size'] = iconSize;
    data['is_disabled'] = isDisabled;
    data['is_shareable'] = isShareable;
    data['is_internal'] = isInternal;
    return data;
  }
}

class HC6 extends CardModelHcGroups{
/*
{
  "id": 77,
  "name": "hc6Small",
  "design_type": "HC6",
  "card_type": 1,
  "cards": [
    {
      "id": 3,
      "name": "smallCardWithArrow",
      "slug": "smallCardWithArrow",
      "title": " ",
      "formatted_title": {
        "text": " ",
        "align": "left",
        "entities": [
          {
            "text": "Small card with an arrow ",
            "type": "generic_text",
            "color": "#000000",
            "font_style": "underline",
            "font_family": "met_semi_bold"
          }
        ]
      },
      "icon": {
        "image_type": "ext",
        "image_url": "https://westeros.r2.famapp.xyz/media/images/generic/7d566650409c4a289957b030c3fee111.png",
        "webp_image_url": "https://westeros.r2.famapp.xyz/media/images/generic/7d566650409c4a289957b030c3fee111.png.webp",
        "aspect_ratio": 1
      },
      "positional_images": [
        null
      ],
      "components": [
        null
      ],
      "url": "fp://fampay.in/pay/",
      "bg_color": "#FBAF03",
      "icon_size": 16,
      "is_disabled": false,
      "is_shareable": false,
      "is_internal": false
    }
  ],
  "is_scrollable": false,
  "height": 32,
  "is_full_width": true,
  "level": 1
}
*/

  int? id;
  String? name;
  String? designType;
  int? cardType;
  List<HC6Cards?>? cards;
  bool? isScrollable;
  int? height;
  bool? isFullWidth;
  int? level;

  HC6({
    this.id,
    this.name,
    this.designType,
    this.cardType,
    this.cards,
    this.isScrollable,
    this.height,
    this.isFullWidth,
    this.level,
  });
  HC6.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    designType = json['design_type']?.toString();
    cardType = json['card_type']?.toInt();
    if (json['cards'] != null) {
      final v = json['cards'];
      final arr0 = <HC6Cards>[];
      v.forEach((v) {
        arr0.add(HC6Cards.fromJson(v));
      });
      cards = arr0;
    }
    isScrollable = json['is_scrollable'];
    height = json['height']?.toInt();
    isFullWidth = json['is_full_width'];
    level = json['level']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['design_type'] = designType;
    data['card_type'] = cardType;
    if (cards != null) {
      final v = cards;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['cards'] = arr0;
    }
    data['is_scrollable'] = isScrollable;
    data['height'] = height;
    data['is_full_width'] = isFullWidth;
    data['level'] = level;
    return data;
  }
}
