import 'package:flutter/material.dart';
import 'package:simple_navigation/simple_navigation.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('home'));
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Nav.routes = {'/': Home()};
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Nav(
//        child: Scaffold(body: Center(child: Text('search me for search'))),
      ),
    );
  }
}
