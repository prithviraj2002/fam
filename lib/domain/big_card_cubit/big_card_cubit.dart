import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Cubit to implement temporary and permanent visibility of big card hc6.
class BigCardCubit extends Cubit<bool?> {
  BigCardCubit() : super(null) {
    _loadVisibilityState();
  }

  Future<void> _loadVisibilityState() async {
    //Using shared preferences to permanently remove hc6 big card.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isVisible = prefs.getBool('bigCardVisibility');
    emit(isVisible ?? true);
  }

  void toggleVisibility() => emit(!state!);

  //hides the card permanently.
  Future<void> hidePermanently() async {
    emit(false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('bigCardVisibility', false);
  }

  //Not used in the ui. But can be used to reset the card back after hiding permanently.
  Future<void> resetVisibility() async {
    emit(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('bigCardVisibility', true);
  }
}
