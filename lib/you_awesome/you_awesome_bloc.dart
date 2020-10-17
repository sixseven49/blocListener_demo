import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_blocListener/models/user_model.dart';
import 'package:demo_blocListener/you_awesome/index.dart';

class YouAwesomeBloc extends Bloc<YouAwesomeEvent, YouAwesomeState> {
  YouAwesomeBloc():super(LoadingState());
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  Stream<YouAwesomeState> mapEventToState( YouAwesomeEvent event, ) async* {
    if (event is Load) {
      yield* _mapLoadToState(event);
    }
    if (event is Save) {
     yield* _mapSaveToState(event);
    }
  }
  Stream<YouAwesomeState> _mapLoadToState(event) async* {
    yield LoadingState();
    try{
      Future<UserModel> fetchUserOrder() =>
      Future.delayed(
        Duration(seconds: 2),
        () => UserModel(id: '1', email: 'example@gmail.com', first_name: 'Peter', last_name: 'Watson'),
      );
      final user = await fetchUserOrder();
      yield InitalState(user: user);
    }catch(err) {
      yield FailedState(message: "error");
    }
  }
  Stream<YouAwesomeState> _mapSaveToState(event) async* {
    yield LoadingState();
    try{
      final user = await fetchSaveUser(event);
      yield LoadedState(user: user);
    }catch(err) {
      yield FailedState(message: "error");
    }   
  }
    Future<UserModel> fetchSaveUser(event) =>
      Future.delayed(
        Duration(seconds: 2),
        () => event.user
      );
}
