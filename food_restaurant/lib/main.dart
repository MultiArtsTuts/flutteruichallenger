import 'package:flutter/material.dart';
import 'package:food_restaurant/blocs/bloc_provider.dart';
import 'package:food_restaurant/blocs/counter_bloc.dart';
import 'package:food_restaurant/pages/bottom_bar_page.dart';
import 'package:food_restaurant/pages/home_page.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: BlocProvider(child: BottomBarPage(), bloc: CounterBloc(),),
      ),
    );
  }
}

