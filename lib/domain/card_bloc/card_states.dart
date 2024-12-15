import 'package:fam/domain/model/card_model.dart';

// This is the base class of card state.
// All the other states are extended from this base class.
abstract class CardState {}

class CardInitial extends CardState {}

class CardLoading extends CardState {}

class CardData extends CardState {
  final CardModel model;

  CardData({required this.model});
}

class CardError extends CardState {
  final String errorMessage;

  CardError({required this.errorMessage});
}
