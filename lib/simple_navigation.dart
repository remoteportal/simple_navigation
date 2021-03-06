// Copyright 2020 Peter Alvin. All rights reserved.

library simple_navigation;

import 'package:flutter/material.dart';

class NavItem {
  NavItem(this.route, [this.args]);

  String route;
  Map<String, dynamic>? args;

  @override
  String toString() {
    StringBuffer sb = new StringBuffer();

    if (args == null) {
      return route;
    } else {
      args!.forEach((k, v) {
        sb.write('$k=$v ');
      });

      return '$route: ${sb.toString()}';
    }
  }
}

late _NavState nav;

class Nav extends StatefulWidget {
  static Map<String, dynamic> get args => nav.args ?? {}; //TODO: make option

  static String get backButtonCaption => nav.backButtonCaption();

  static bool get canPop => nav.canPop;

  static bool get hasArgs => nav.hasArgs;

  static List<NavItem> get stack => nav.stack;

  //TODO: https://stackoverflow.com/questions/57198087/dart-generics-abstract-static-methods
  static NavItem pop() {
    return nav.pop();
  }

  static popAll() {
    nav.popAll();
  }

  static repl(String route, [Map<String, dynamic>? args]) {
    nav.repl(route, args);
  }

  static push(String route, [Map<String, dynamic>? args]) {
    nav.push(route, args);
  }

  static late Map<String, WidgetBuilder> routes;

  /// map to replace routes with other routes (/home => /homeNew)
  static Map<String, String>? routesOverride;

//  static NavItem get top => nav.stack.last;

//  Nav({this.child});  // , this.routeMap
  Nav({this.backButtonCaptionCallback, this.log = false}); // , this.routeMap

  final Function? backButtonCaptionCallback;
  final bool log;

  @override
  _NavState createState() {
    return nav = _NavState();
  }
}

class _NavState extends State<Nav> {
  List<NavItem> _stack = [NavItem('/')];

  Map<String, dynamic>? get args => _stack.last.args;

  String backButtonCaption() {
    String s;

    if (_stack.length == 1) {
      s = '/'; //TODO//CONFIG
    } else {
      s = _stack[_stack.length - 2].route; //TODO: not human
    }

    if (widget.backButtonCaptionCallback != null) {
      s = widget.backButtonCaptionCallback!(s);
    } else {
      s = s.replaceAll('/', '');
    }

    return s;
  }

  @override
  Widget build(BuildContext context) {
    Widget w;

    Function? fn = Nav.routes[_stack.last.route];

    if (widget.log) print("Nav: build: ${_stack.last.route}");

    if (fn == null) {
      List<Widget> l = []
        ..add(Text('404')) //DART: method-cascades
        ..add(Text('stack=$_stack'))
        ..addAll(Nav.routes
            .keys //DART: can't sort?  https://stackoverflow.com/questions/12888206/how-can-i-sort-a-list-of-strings-in-dart
            .map((k) => Text(k))
            .toList()); //PATTERN: append-list
      w = Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: l,
          ),
        ),
      );
    } else {
      w = fn(context);
    }

//      return Container(child: w);
    return WillPopScope(
        onWillPop: () async {
//            if (widget.log) print("Nav: hardware pop => false");
          pop();
          return false;
        },
        child: w);
  }

  bool get canPop => _stack.length > 1;

  @override
  void dispose() {
    super.dispose();
  }

  bool get hasArgs => _stack.last.args != null;

  @override
  void initState() {
    super.initState();
  }

  void repl(String route, [Map<String, dynamic>? args]) {
    _stack.removeLast(); // NavItem ni

    var ni = NavItem(route, args);

    route = _standardize(ni, 'repl');

    setState(() {
      _stack.add(ni);
    });
  }

  NavItem pop() {
    NavItem ni;

    if (_stack.length == 1) {
      ni = _stack.last;
    } else {
      ni = _stack.removeLast();
    }

    //CORNER-CASE: in case route being popped has since been overridden, even if at root (/).
    NavItem cur = _stack.last;
    cur.route = _standardize(cur, 'pop');
    setState(() {
      stack.removeLast();
      stack.add(cur);
    });

    return ni;
  }

  void popAll() {
    NavItem cur = _stack.first;
    cur.route = _standardize(cur, 'popAll');
    setState(() {
      stack.clear();
      stack.add(cur);
    });
  }

  void push(String route, [Map<String, dynamic>? args]) {
    var ni = NavItem(route, args);

    route = _standardize(ni, 'push');

    setState(() {
      _stack.add(ni);
    });
  }

  List<NavItem> get stack => _stack;

  String _standardize(NavItem ni, String why) {
    String xtra = '';

    if (!ni.route.startsWith('/')) {
      ni.route = "/${ni.route}";
    }

    if (Nav.routesOverride != null) {
      String? _ = Nav.routesOverride![ni.route];
      if (_ != null) {
        xtra = '${ni.route} => ';
        ni.route = _;
      }
    }

    if (widget.log) print("Nav: $why: $xtra$ni");

    return ni.route;
  }
}
