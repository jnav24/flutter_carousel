import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flip Carousel',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Status Bar
          new Container(
            width: double.infinity,
            height: 20.0,
          ),

          // Cards
          new Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Card()
            )
          ),

          // Bottom Bar
          new Container(
            width: double.infinity,
            height: 50.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // background
        new ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: new Image.asset(
            'assets/doom.jpg',
            fit: BoxFit.cover,
          )
        ),

        // content
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: new Text(
                  '10th Street'.toUpperCase(),
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'petita',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0
                  )
              ),
            ),
            new Expanded(child: new Container()),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  '2 - 3',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 140.0,
                    fontFamily: 'petita',
                    letterSpacing: -5.0
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30.0),
                  child: new Text(
                      'FT',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontFamily: 'petita',
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
                new Text(
                  '65.1°',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'petita',
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            new Expanded(child: new Container()),
          ],
        )
      ],
    );
  }
}
