library simple_navigation;

import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  Nav({this.child});

  final Widget child;

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Container(child:widget.child);
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
