import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/services.dart';
import 'package:shoes_ui/pages/home_page.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue,
    statusBarColor: Colors.pink,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}