library simple_navigation;

import 'package:flutter/material.dart';

class NavItem {
  NavItem(this.route, [this.args]);

  String route;
  Map<String, dynamic> args;
}

_NavState nav;

class Nav extends StatefulWidget {
  static NavItem pop() {
    if (stack.length == 1) {
      return stack.first;
    } else {
      return stack.removeLast();
    }
  }

  static push(String route, [Map<String, dynamic> args]) {
    stack.add(NavItem(route, args));
  }

  static Map<String, Widget> routes;
  static List<NavItem> stack = [NavItem('/')];

  static NavItem get top => stack.last;

//  Nav({this.child});  // , this.routeMap
  Nav(); // , this.routeMap

//  final Widget child;

//  final Map<String,Widget> routeMap;

  @override
  _NavState createState() {
    return nav = _NavState();
  }
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
//    return Container(child: widget.child);
    return Container(child: Nav.routes['/']);
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
