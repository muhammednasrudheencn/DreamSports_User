import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dream_sports_user/services/login_logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splashbloc_event.dart';
part 'splashbloc_state.dart';

class SplashblocBloc extends Bloc<SplashblocEvent, SplashblocState> {
  SplashblocBloc() : super(SplashblocInitial()) {
    on<InitialEvent>(initialevent);
  }

  Future<void> initialevent(
      InitialEvent event, Emitter<SplashblocState> emit) async {
    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bool? islogin = sharedPreferences.getBool(savekey);

    if (islogin == null || islogin == false) {
      emit(NavigateToLogin());
    } else {
      emit(NavigateToHome());
    }
  }
}
