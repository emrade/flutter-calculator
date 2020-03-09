import 'package:calculator/views/home/home.dart';
import 'package:flutter/material.dart';

const String homeViewRoute = '/';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
      break;
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
