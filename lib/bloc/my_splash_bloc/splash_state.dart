import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

// case 1: Initial state
class SplashInitial extends SplashState{}

//case 2: Loding state
class SplashLoading extends SplashState{}

//case 3: Loading finish - move to next screen
class SplashLoaded extends SplashState{}