import 'package:flutter/material.dart';
import 'package:simple_navigation/simple_navigation.dart';

class Scrn extends StatelessWidget {
  Scrn(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    print("scrn build");

    return Column(
      children: <Widget>[
        Text('${Nav.stack}'),
        Text(name),
        RaisedButton(
            child: Text('pop'),
            onPressed: () {
              Nav.pop();
            }),
        RaisedButton(
            child: Text('a'),
            onPressed: () {
              print("pressed a");
              Nav.push('/a');
            }),
        RaisedButton(
            child: Text('b'),
            onPressed: () {
              print("pressed b");
              Nav.push('/b');
            })
      ],
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Nav.routes = {
    '/': Scrn('home'),
    '/a': Scrn('a'),
    '/b': Scrn('b'),
  };
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: Nav(
//        child: Scaffold(body: Center(child: Text('search me for search'))),
            ),
      ),
    );
  }
}
