library simple_navigation;

import 'package:flutter/material.dart';

class NavItem {
  NavItem(this.route, [this.args]);

  String route;
  Map<String, dynamic> args;

  @override
  String toString() => route;
}

_NavState nav;

class Nav extends StatefulWidget {
  static NavItem pop() {
    return nav.pop();
  }

  static repl(String route, [Map<String, dynamic> args]) {
    nav.repl(route, args);
  }

  static push(String route, [Map<String, dynamic> args]) {
    nav.push(route, args);
  }

  static Map<String, WidgetBuilder> routes;

  static List<NavItem> get stack => nav.stack;

//  static NavItem get top => nav.stack.last;

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
  List<NavItem> _stack = [NavItem('/')];

  @override
  Widget build(BuildContext context) {
    if (Nav.routes == null) {
      return Text('Nav.routes is null');
    } else {
      Widget w;

      Function fn = Nav.routes[_stack.last.route];

      print("Nav build: ${_stack.last.route}");

      if (fn == null) {
        w = Scaffold(
          body: Column(
            children: <Widget>[
              Text('404'),
              Text('key=${_stack.last}'),
              Text('routes=${Nav.routes}'),
            ],
          ),
        );
      } else {
//      print("found");
        w = fn(context);
      }

//      return Container(child: w);
      return WillPopScope(
          onWillPop: () async {
            print("hardware pop => false");
            pop();
            return false;
          },
          child: w);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void repl(String route, [Map<String, dynamic> args]) {
    _stack.removeLast(); // NavItem ni

    if (!route.startsWith('/')) {
      route = "/$route";
    }

    print("repl $route");
    setState(() {
      _stack.add(NavItem(route, args));
    });
  }

  NavItem pop() {
    NavItem ni;
    if (_stack.length == 1) {
      ni = _stack.first;
    } else {
      setState(() {
        ni = _stack.removeLast();
      });
    }

    return ni;
  }

  void push(String route, [Map<String, dynamic> args]) {
    if (!route.startsWith('/')) {
      route = "/$route";
    }

    print("push $route");
    setState(() {
      _stack.add(NavItem(route, args));
    });
  }

  List<NavItem> get stack => _stack;
}
