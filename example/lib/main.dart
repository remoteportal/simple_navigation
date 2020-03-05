import 'package:flutter/material.dart';
import 'package:simple_navigation/simple_navigation.dart';

class Scrn extends StatefulWidget {
  Scrn(this.name);

  final String name;

  @override
  _ScrnState createState() => _ScrnState();
}

class _ScrnState extends State<Scrn> {
  @override
  Widget build(BuildContext context) {
    print("scrn build");

    return Column(
      children: <Widget>[
        Text('${Nav.stack}'),
        Text(widget.name),
        RaisedButton(
            child: Text('pop'),
            onPressed: () {
              Nav.pop();
            }),
        RaisedButton(
            child: Text('push a'),
            onPressed: () {
//              print("pressed a");
              Nav.push('/a');
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
            })
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

//class Scrn extends StatelessWidget {
//  Scrn(this.name);
//
//  final String name;
//
//  @override
//  Widget build(BuildContext context) {
//    print("scrn build");
//
//    return Column(
//      children: <Widget>[
//        Text('${Nav.stack}'),
//        Text(name),
//        RaisedButton(
//            child: Text('pop'),
//            onPressed: () {
//              Nav.pop();
//            }),
//        RaisedButton(
//            child: Text('push a'),
//            onPressed: () {
////              print("pressed a");
//              Nav.push('/a');
//            }),
//        RaisedButton(
//            child: Text('push b'),
//            onPressed: () {
////              print("pressed b");
//              Nav.push('/b');
//            }),
//        RaisedButton(
//            child: Text('repl a'),
//            onPressed: () {
////              print("pressed a");
//              Nav.repl('/a');
//            }),
//        RaisedButton(
//            child: Text('repl b'),
//            onPressed: () {
////              print("pressed b");
//              Nav.repl('/b');
//            })
//      ],
//    );
//  }
//}

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
