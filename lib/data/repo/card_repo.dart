import 'package:fam/data/service/card_service.dart';
import 'package:fam/domain/model/card_model.dart';

//This is a card repository class.
//The functions here are abstract and are called using service object.
class CardRepo {
  CardService service;

  CardRepo({required this.service});

  Future<CardModel> getCardsData() => service.getCardData();
}
