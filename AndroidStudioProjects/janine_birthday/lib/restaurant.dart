import 'dart:ui';

import 'package:flutter/material.dart';

import 'appRoutes.dart';

class Restaurant extends StatefulWidget {
  Restaurant({Key key}) : super(key: key);

  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  TextEditingController _idController = TextEditingController();

  List answers = ["25", "25 hours", "25 hours hotel"];

  void submit() {
    final form = this._formKey.currentState;
    if (form.validate()) {
      form.save();
      if (answers.contains(_idController.text.trim().toLowerCase())) {
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
          title: Text("Restaurant"),
        ),
        body: SingleChildScrollView(
      child:
          Container(
            height: MediaQuery.of(context).size.height-200,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              sigmaX != 10 ?Text("25 Hours Hotel",textScaleFactor: 2,):Container(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/restaurant.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                child:
                Stack(children:[
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                child: Container(
                  color: Colors.black.withOpacity(_opacity),
                ),
              ),])),


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
                                "One day + 1 and we will have a good time",
                                textScaleFactor: 1.5,
                              ),
                            ),
                            new Padding(
                                padding: EdgeInsets.all(10) ,
                                child:Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: new TextFormField(
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
                                  Navigator.of(context).pushNamed(AppRoutes.SURPRISE);
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
