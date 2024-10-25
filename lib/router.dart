import 'package:flutter/material.dart';
import 'package:news_app/pages/home/page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const HomePage());
    // case '/Account/Application':
    //   return MaterialPageRoute(builder: (_) => const AccountApplicationPage());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('No data...'),),));
  }
}
