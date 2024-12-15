import 'package:bloc/bloc.dart';
import 'package:fam/data/repo/card_repo.dart';
import 'package:fam/domain/card_bloc/card_events.dart';
import 'package:fam/domain/card_bloc/card_states.dart';
import 'package:fam/domain/model/card_model.dart';

//Card bloc to event states as per events.
class CardBloc extends Bloc<CardEvent, CardState> {
  CardRepo repo;

  CardBloc({required this.repo}) : super(CardInitial()) {
    on<GetCards>((event, emit) async {
      emit(CardLoading());

      try {
        CardModel cardModel = await repo.getCardsData();

        emit(CardData(model: cardModel));
      } catch (e) {
        emit(CardError(errorMessage: e.toString()));
      }
    });
  }
}
