import 'package:demo_blocListener/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo_blocListener/you_awesome/index.dart';

class YouAwesomeScreen extends StatefulWidget {
  final Function save;
  final Function refresh;
  const YouAwesomeScreen({Key key, this.refresh, this.save}) : super(key: key);

  @override
  YouAwesomeScreenState createState() {
    return YouAwesomeScreenState();
  }
}

class YouAwesomeScreenState extends State<YouAwesomeScreen> {
  YouAwesomeScreenState();
  UserModel newUser = UserModel(
      id: '1',
      email: 'example@gmail.com',
      first_name: 'Peter2',
      last_name: 'Watson2');
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Center(
          child: Column(children: [
            RaisedButton(
              onPressed: () {
                widget.save(newUser);
              },
              child: Text("save"),
            ),
            RaisedButton(
              onPressed: () {
                widget.refresh();
              },
              child: Text("Refresh"),
            )
          ]),
        ));
  }
}
