import 'package:flutter/material.dart';
import 'package:simple_navigation/simple_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Nav(
        child: Scaffold(
            body: Center(
                child: Text('search me for search'))),
      ),
    );
  }
}
