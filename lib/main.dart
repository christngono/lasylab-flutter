import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lasylab_mobile_app/routes.dart';

void main() {
  runApp(MyApp(initialRoute: "/"));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({this.initialRoute = "/"});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}
