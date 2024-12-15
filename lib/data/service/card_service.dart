import 'dart:convert';

import 'package:fam/domain/model/card_model.dart';
import 'package:fam/domain/model/hc3_model.dart';
import 'package:flutter/material.dart';

import '../../endpoints/endpoints.dart';
import 'package:http/http.dart' as http;

//This is the service class.
//All the functions interacting with the db are written here.
class CardService {
  String baseUrl;

  CardService({this.baseUrl = Endpoints.url});

  Future<CardModel> getCardData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      List<dynamic> cardData = jsonDecode(response.body);

      CardModel model = CardModel.fromJson(cardData.first);

      return model;
    } catch (e) {
      debugPrint("An exception occurred while getting cards data: $e");
      throw Exception(e.toString());
    }
  }
}
