// Copyright 2020 Peter Alvin. All rights reserved.

import 'package:flutter/material.dart';
import 'package:simple_navigation/simple_navigation.dart';

int counter = 0;

class Scrn extends StatefulWidget {
  Scrn(this.name) {
    print("$name called");
  }

  final String name;

  @override
  _ScrnState createState() => _ScrnState();
}

class _ScrnState extends State<Scrn> {
  @override
  Widget build(BuildContext context) {
    String xtra = '';
//    if (ModalRoute.of(context).settings.arguments != null) {
//      xtra = ': ARGS=${ModalRoute.of(context).settings.arguments}';
//    }

    if (Nav.hasArgs) {
      xtra = ': ARGS=${Nav.args}';
    }

    print("scrn build: ${widget.name}$xtra");

    return Column(
      children: <Widget>[
        RaisedButton(
            child: Text(Nav.backButtonCaption),
            onPressed: () {
              Nav.pop();
            }),
        Text('${Nav.stack}', style: TextStyle(fontSize: 20)),
        Text('${widget.name}', style: TextStyle(fontSize: 30)),
        Text('$xtra', style: TextStyle(fontSize: 15)),
        RaisedButton(
            child: Text('pop'),
            onPressed: () {
              Nav.pop();
            }),
        RaisedButton(
            child: Text('popAll'),
            onPressed: () {
              Nav.popAll();
            }),
        RaisedButton(
            child: Text('push a'),
            onPressed: () {
//              print("pressed a");
              Nav.push('/a', {'counter': ++counter});
            }),
        RaisedButton(
            child: Text('push b'),
            onPressed: () {
//              print("pressed b");
              Nav.push('/b');
            }),
        RaisedButton(
            child: Text('repl a'),
            onPressed: () {
//              print("pressed a");
              Nav.repl('/a');
            }),
        RaisedButton(
            child: Text('repl b'),
            onPressed: () {
//              print("pressed b");
              Nav.repl('/b');
            }),
        RaisedButton(
            child: Text('push deanna'),
            onPressed: () {
              Nav.push('/deanna');
            }),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print("routes");
  Nav.routes = {
    '/': (context) => Scrn('home'),
    '/a': (context) => Scrn('a'),
    '/b': (context) => Scrn('b'),
  };
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Nav(
//        child: Scaffold(body: Center(child: Text('search me for search'))),
            backButtonCaptionCallback: (String route) {
          String s = route.toUpperCase().replaceAll('/', '');
          return s.length == 0 ? 'home' : s;
        }),
      ),
    );
  }
}
