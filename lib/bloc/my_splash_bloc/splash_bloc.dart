import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/my_splash_bloc/splash_event.dart';
import 'package:news_app/bloc/my_splash_bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState>{
  // SplashBloc(super.initialState);
  SplashBloc() : super(SplashInitial()){
    //on trigger event - load splash
    on<LoadSplash>((event, emit) async{
      //emit loading-state 
      emit(SplashLoading());

      //wait
      await Future.delayed(const Duration(seconds:2));

      //emit loading-complete state navigate to home
      emit(SplashLoaded());
    },);
  }
  

}