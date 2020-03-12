import 'package:calculator/views/history/history.dart';
import 'package:calculator/views/home/home.dart';
import 'package:flutter/material.dart';

const String homeViewRoute = '/';
const String historyViewRoute = 'history';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
      break;
      
    case historyViewRoute:
      return MaterialPageRoute(builder: (_) => HistoryPage());
      break;

    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
