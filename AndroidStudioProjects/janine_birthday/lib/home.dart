import 'package:flutter/material.dart';

import 'appRoutes.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happy Birthday"),
      ),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home.jpg"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: new Center(
            child: RawMaterialButton(
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
                fillColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.RESTAURANT);
                },
                child: Text("Start", style: new TextStyle(color: Colors.white)))),
      )),
    );
  }

  @override
  void initState() {}
}
