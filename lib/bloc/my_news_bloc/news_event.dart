import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


// News Event 
@immutable
abstract class NewsEvent extends Equatable{
  const NewsEvent();
  @override
  List<Object> get props => [];
}

// case 1: load News 
class LoadNews extends NewsEvent{}