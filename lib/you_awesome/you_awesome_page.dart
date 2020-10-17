import 'package:flutter/material.dart';
import 'package:demo_blocListener/you_awesome/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YouAwesomePage extends StatefulWidget {
  static const String routeName = '/youAwesome';

  @override
  _YouAwesomePageState createState() => _YouAwesomePageState();
}

class _YouAwesomePageState extends State<YouAwesomePage> {
  void initState(){
    super.initState();
    _load();
  }
  void _load() {
    BlocProvider.of<YouAwesomeBloc>(context).add(Load());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouAwesome'),
      ),
      body: BlocBuilder<YouAwesomeBloc, YouAwesomeState>(
        builder: (
          BuildContext context,
          YouAwesomeState currentState,
        ) {
          print(currentState);
          if (currentState is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is FailedState) {
            return Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.message ?? 'Error'),
                ],
            ));
          }
           if (currentState is LoadedState || currentState is InitalState) {
            return YouAwesomeScreen(
              save: (newUser) {
                BlocProvider.of<YouAwesomeBloc>(context).add(Save(user: newUser));
              },
              refresh: () {
                BlocProvider.of<YouAwesomeBloc>(context).add(Load());
              },
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        }
        )
      
    );
  }
}
