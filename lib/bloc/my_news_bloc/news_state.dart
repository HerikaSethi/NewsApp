import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewsState extends Equatable{
  const NewsState();

  @override
  List<Object> get props => [];
}

// case 1: Initial state 
class NewsInitial extends NewsState{

}

// case 2: In progress state 
class NewsLoading extends NewsState{

}

//case 3: Loding complete state
class NewsLoaded extends NewsState{
  final Map<String, dynamic> data;

  const NewsLoaded(this.data);

  @override
  List<Object> get props => [data];
}

//case 4: Error occured state
class NewsError extends NewsState{

}