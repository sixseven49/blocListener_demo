import 'package:demo_blocListener/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class YouAwesomeState extends Equatable {
  const YouAwesomeState();
  @override
  List<Object> get props => [];
}
class LoadingState extends YouAwesomeState{}

class InitalState extends YouAwesomeState{
  final UserModel user;
  InitalState({@required this.user});
  @override
  List<Object> get props => [user];
}
class LoadedState extends YouAwesomeState{
  final UserModel user;
  LoadedState({@required this.user});
  @override
  List<Object> get props => [user];
}
class FailedState extends YouAwesomeState{
  final String message;
  FailedState({this.message});
  @override
  List<Object> get props => [message];
}
