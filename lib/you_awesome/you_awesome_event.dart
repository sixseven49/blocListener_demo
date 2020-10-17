import 'package:demo_blocListener/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class YouAwesomeEvent extends Equatable {
  const YouAwesomeEvent();
  @override
  List<Object> get props => [];
}
class Load extends YouAwesomeEvent{}
class Save extends YouAwesomeEvent{
  final UserModel user;
  Save({this.user});
  @override
  List<Object> get props => [user];
}
