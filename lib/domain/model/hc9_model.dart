import 'package:fam/domain/model/card_model.dart';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class HC9CardsBgGradient {
/*
{
  "angle": 336,
  "colors": [
    "#FBAF03"
  ]
}
*/

  int? angle;
  List<String?>? colors;

  HC9CardsBgGradient({
    this.angle,
    this.colors,
  });
  HC9CardsBgGradient.fromJson(Map<String, dynamic> json) {
    angle = json['angle']?.toInt();
    if (json['colors'] != null) {
      final v = json['colors'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      colors = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['angle'] = angle;
    if (colors != null) {
      final v = colors;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['colors'] = arr0;
    }
    return data;
  }
}

class HC9CardsBgImage {
/*
{
  "image_type": "ext",
  "image_url": "https://westeros.r2.famapp.xyz/media/images/generic/a2fef9ff3622456688bc58b521a7c1bd.png",
  "aspect_ratio": 0.6304348
}
*/

  String? imageType;
  String? imageUrl;
  double? aspectRatio;

  HC9CardsBgImage({
    this.imageType,
    this.imageUrl,
    this.aspectRatio,
  });
  HC9CardsBgImage.fromJson(Map<String, dynamic> json) {
    imageType = json['image_type']?.toString();
    imageUrl = json['image_url']?.toString();
    aspectRatio = json['aspect_ratio']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image_type'] = imageType;
    data['image_url'] = imageUrl;
    data['aspect_ratio'] = aspectRatio;
    return data;
  }
}

class HC9Cards{
/*
{
  "id": 5,
  "name": "yellowGradient",
  "slug": "yellow_gradient",
  "positional_images": [
    null
  ],
  "components": [
    null
  ],
  "bg_image": {
    "image_type": "ext",
    "image_url": "https://westeros.r2.famapp.xyz/media/images/generic/a2fef9ff3622456688bc58b521a7c1bd.png",
    "aspect_ratio": 0.6304348
  },
  "bg_gradient": {
    "angle": 336,
    "colors": [
      "#FBAF03"
    ]
  },
  "is_disabled": false,
  "is_shareable": false,
  "is_internal": false
}
*/

  int? id;
  String? name;
  String? slug;
  List<dynamic>? positionalImages;
  List<dynamic>? components;
  HC9CardsBgImage? bgImage;
  HC9CardsBgGradient? bgGradient;
  bool? isDisabled;
  bool? isShareable;
  bool? isInternal;

  HC9Cards({
    this.id,
    this.name,
    this.slug,
    this.positionalImages,
    this.components,
    this.bgImage,
    this.bgGradient,
    this.isDisabled,
    this.isShareable,
    this.isInternal,
  });
  HC9Cards.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    bgImage = (json['bg_image'] != null) ? HC9CardsBgImage.fromJson(json['bg_image']) : null;
    bgGradient = (json['bg_gradient'] != null) ? HC9CardsBgGradient.fromJson(json['bg_gradient']) : null;
    isDisabled = json['is_disabled'];
    isShareable = json['is_shareable'];
    isInternal = json['is_internal'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (bgImage != null) {
    data['bg_image'] = bgImage!.toJson();
    }
    if (bgGradient != null) {
    data['bg_gradient'] = bgGradient!.toJson();
    }
    data['is_disabled'] = isDisabled;
    data['is_shareable'] = isShareable;
    data['is_internal'] = isInternal;
    return data;
  }
}

class HC9 extends CardModelHcGroups{
/*
{
  "id": 79,
  "name": "hc9GradientHCG",
  "design_type": "HC9",
  "card_type": 1,
  "cards": [
    {
      "id": 5,
      "name": "yellowGradient",
      "slug": "yellow_gradient",
      "positional_images": [
        null
      ],
      "components": [
        null
      ],
      "bg_image": {
        "image_type": "ext",
        "image_url": "https://westeros.r2.famapp.xyz/media/images/generic/a2fef9ff3622456688bc58b521a7c1bd.png",
        "aspect_ratio": 0.6304348
      },
      "bg_gradient": {
        "angle": 336,
        "colors": [
          "#FBAF03"
        ]
      },
      "is_disabled": false,
      "is_shareable": false,
      "is_internal": false
    }
  ],
  "is_scrollable": false,
  "height": 195,
  "is_full_width": false,
  "slug": "hc9GradientHCG",
  "level": 3
}
*/

  int? id;
  String? name;
  String? designType;
  int? cardType;
  List<HC9Cards?>? cards;
  bool? isScrollable;
  int? height;
  bool? isFullWidth;
  String? slug;
  int? level;

  HC9({
    this.id,
    this.name,
    this.designType,
    this.cardType,
    this.cards,
    this.isScrollable,
    this.height,
    this.isFullWidth,
    this.slug,
    this.level,
  });
  HC9.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    designType = json['design_type']?.toString();
    cardType = json['card_type']?.toInt();
    if (json['cards'] != null) {
      final v = json['cards'];
      final arr0 = <HC9Cards>[];
      v.forEach((v) {
        arr0.add(HC9Cards.fromJson(v));
      });
      cards = arr0;
    }
    isScrollable = json['is_scrollable'];
    height = json['height']?.toInt();
    isFullWidth = json['is_full_width'];
    slug = json['slug']?.toString();
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
    data['slug'] = slug;
    data['level'] = level;
    return data;
  }
}