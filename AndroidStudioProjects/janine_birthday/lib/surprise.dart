import 'dart:ui';

import 'package:flutter/material.dart';

import 'appRoutes.dart';

class Surprise extends StatefulWidget {
  Surprise({Key key}) : super(key: key);

  @override
  _SurpriseState createState() => _SurpriseState();
}

class _SurpriseState extends State<Surprise> {
  TextEditingController _idController = TextEditingController();


  void submit() {
    final form = this._formKey.currentState;
    if (form.validate()) {
      form.save();
      if (_idController.text.trim().toLowerCase()=="1204") {
        setState(() {
          sigmaX = 0;
          sigmaY = 0;
        });
        //Navigator.of(context).pushNamed(AppRoutes.PUZZLE);
      }
    }
  }

  // Key used to check form validation and to save it
  final _formKey = GlobalKey<FormState>();

  double sigmaX = 10.0; // from 0-10
  double sigmaY = 10.0; // from 0-10
  double _opacity = 0.1; // from 0-1.0
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: Text("Surprise"),
        ),
        body: SingleChildScrollView(
          child:
          Container(
            height: MediaQuery.of(context).size.height-200,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              sigmaX != 10 ?Text("Bravo it's 1204",textScaleFactor: 2,):Container(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/numbers.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                 ),


              Row(children: [
                Expanded(child:
                Container(

                    decoration: new BoxDecoration(color: Colors.white),
                    child:  Form(
                      // form key to check the form state on submission
                      key: _formKey,
                      child: new Column(
                        children: <Widget>[
                          new Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              "(100 + 300 / 2 + 400 - 46) / 2 =",
                              textScaleFactor: 1.5,
                            ),
                          ),
                          new Padding(
                              padding: EdgeInsets.all(10) ,
                              child:Container(
                                width: MediaQuery.of(context).size.width,
                                child: new TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _idController,
                                  textInputAction: TextInputAction.go,
                                ),
                              )),
                          // email input
                          sigmaX == 10 ?Container(
                            width: 200,
                            child: new FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
                              child: new Text("Answer", textScaleFactor: 1, style: new TextStyle(color: Colors.white)),
                              color: Colors.lightBlue,
                              onPressed: () {
                                submit();
                              },
                            ),
                          ):Container(
                            width: 200,
                            child: new FlatButton(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
                              child: new Text("Next", textScaleFactor: 1, style: new TextStyle(color: Colors.white)),
                              color: Colors.green,
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRoutes.PUZZLE);
                              },
                            ),
                          ),
                        ],
                      ),
                    ))),
              ]),
            ]),
          ),

        ));
  }

  @override
  void initState() {}
}
