import 'package:cached_network_image/cached_network_image.dart';
import 'package:fam/domain/big_card_cubit/big_card_cubit.dart';
import 'package:fam/domain/model/card_model.dart';
import 'package:fam/domain/model/hc1_model.dart';
import 'package:fam/domain/model/hc3_model.dart';
import 'package:fam/domain/model/hc5_model.dart';
import 'package:fam/domain/model/hc6_model.dart';
import 'package:fam/domain/model/hc9_model.dart';
import 'package:fam/presentation/components/hc1_card.dart';
import 'package:fam/presentation/components/hc3_card.dart';
import 'package:fam/presentation/components/hc5_card.dart';
import 'package:fam/presentation/components/hc6_card.dart';
import 'package:fam/presentation/components/hc9_card.dart';
import 'package:flutter/material.dart';

//This is the contextual card. Single widget that renders different cards according to design systems.
class ContextualCard extends StatelessWidget {
  final CardModelHcGroups? hcGroup;
  final HC1Cards? hc1;
  final HC3Cards? hc3;
  final HC5Cards? hc5;
  final HC6Cards? hc6;
  final HC9Cards? hc9;
  final BigCardCubit? cubit;
  final double? height;
  final double? width;

  const ContextualCard(
      {this.hcGroup,
      this.hc1,
      this.hc3,
      this.hc5,
      this.hc6,
      this.hc9,
      this.cubit,
      this.height,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (hcGroup!.designType == "HC1" && hc1 != null) {
      if (width != null) {
        return Hc1Card(
          card: hc1,
          width: width!,
        );
      }
      return Hc1Card(card: hc1);
    }
    else if (hcGroup!.designType == "HC3" && cubit != null && hc3 != null) {
      return Hc3Card(card: hc3, cubit: cubit!);
    }
    else if (hcGroup!.designType == "HC5" && hc5 != null) {
      return Hc5Card(card: hc5);
    }
    else if (hcGroup!.designType == "HC6" && hc6 != null) {
      return Hc6Card(card: hc6);
    }
    else if (hcGroup!.designType == "HC9" && hc9 != null) {
      return Hc9Card(card: hc9);
    }
    else {
      return Container();
    }
  }
}
