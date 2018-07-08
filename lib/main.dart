import 'dart:ui';

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
            child: new CardFlipper()
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

class CardFlipper extends StatefulWidget {
  @override
  _CardFlipperState createState() => new _CardFlipperState();
}

class _CardFlipperState extends State<CardFlipper> with TickerProviderStateMixin {
  double scrollPercent = 0.0;
  Offset startDrag;
  double startDragPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;
  AnimationController finishScrollController;

  @override
  void initState() {
    super.initState();
    finishScrollController = new AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    )
    ..addListener(() {
      setState(() {
        scrollPercent = lerpDouble(finishScrollStart, finishScrollEnd, finishScrollController.value);
      });
    });
  }

  @override
  void dispose() {
    finishScrollController.dispose();
    super.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currentDrag = details.globalPosition;
    final dragDistance = currentDrag.dx - startDrag.dx;
    final singleCardDragPercent = dragDistance / context.size.width;
    final numCards = 3;

    setState(() {
      scrollPercent = (startDragPercentScroll + (-singleCardDragPercent / numCards)).clamp(0.0, 1.0 - (1/numCards));
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final numCards = 3;
    finishScrollStart = scrollPercent;
    finishScrollEnd = (scrollPercent * numCards).round() / numCards;
    finishScrollController.forward(from: 0.0);

    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  List<Widget> _buildCards() {
    return [
      _buildCard(0, 3, scrollPercent),
      _buildCard(1, 3, scrollPercent),
      _buildCard(2, 3, scrollPercent),
    ];
  }

  Widget _buildCard(int cardIndex, int cardCount, double scrollPercent) {
    final cardScrollPercent = scrollPercent / (1 / cardCount);

    return FractionalTranslation(
        translation: new Offset(cardIndex - cardScrollPercent, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Card(),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      behavior: HitTestBehavior.translucent,
      child: Stack(
          children: _buildCards()
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Text(
                    '65.1°',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'petita',
                      fontWeight: FontWeight.bold,
                    ),
                ),
                )
              ],
            ),
            new Expanded(child: new Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0, top: 50.0),
              child: new Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(30.0),
                  border: new Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(
                        'Mostly Cloudy',
                        style: new TextStyle(
                          color: Colors.white,
                          fontFamily: 'petita',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Icon(
                          Icons.wb_cloudy,
                          color: Colors.white,
                        ),
                      ),
                      new Text(
                        '11.2mph ENE',
                        style: new TextStyle(
                          color: Colors.white,
                          fontFamily: 'petita',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
