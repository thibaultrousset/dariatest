import 'package:flutter/material.dart';

import 'appRoutes.dart';

class Congrats extends StatefulWidget {
  Congrats({Key key}) : super(key: key);

  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happy Birthday"),
      ),
      body: SafeArea(
          child: Image(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,


                image: AssetImage("images/congrats.gif"),

                fit: BoxFit.fitWidth,


          )),
    );
  }

  @override
  void initState() {}
}
