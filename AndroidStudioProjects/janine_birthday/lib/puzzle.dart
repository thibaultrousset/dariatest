import 'package:flutter/material.dart';
import 'package:janine_birthday/puzzlePiece.dart';

import 'appRoutes.dart';

class Puzzle extends StatefulWidget {
  Puzzle({Key key}) : super(key: key);
  final int rows = 4;
  final int cols = 4;

  @override
  _PuzzleState createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  List<Widget> pieces = [];
  bool finished = false;
  int piecesFinished = 0;
  // here we will split the image into small pieces using the rows and columns defined above; each piece will be added to a stack
  void splitImage(Image image) async {
    for (int x = 0; x < widget.rows; x++) {
      for (int y = 0; y < widget.cols; y++) {
        setState(() {
          pieces.add(PuzzlePiece(
              key: GlobalKey(),
              image: image,
              row: x,
              col: y,
              maxRow: widget.rows,
              maxCol: widget.cols,
              bringToTop: this.bringToTop,
              sendToBack: this.sendToBack));
        });
      }
    }
  }

  // when the pan of a piece starts, we need to bring it to the front of the stack
  void bringToTop(Widget widget) {
    setState(() {
      pieces.remove(widget);
      pieces.add(widget);
    });
  }

// when a piece reaches its final position, it will be sent to the back of the stack to not get in the way of other, still movable, pieces
  void sendToBack(Widget widget) {
    setState(() {
      piecesFinished++;
      pieces.remove(widget);
      pieces.insert(0, widget);
      if (piecesFinished == 16) {
        finished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Puzzle"),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              child: new Center(
                child: Stack(children: pieces),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: finished == true ? Container(
              width: 200,

              child: new FlatButton(
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
                child: new Text("Get your gift", textScaleFactor: 1, style: new TextStyle(color: Colors.white)),
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CONGRATS);
                },
              ),
            ):Container())
          ],
        )));
  }

  @override
  void initState() {
    splitImage(Image(image: AssetImage("images/puzzle.jpg")));
  }
}
