import 'dart:async';

import 'package:rxdart/rxdart.dart';

class ColorBloc {

  final StreamController<bool> _changeColor = PublishSubject<bool>();

  Function(bool) get changeColour => _changeColor.sink.add;

  Stream<bool> get colour => _changeColor.stream;

  void dispose(){
    _changeColor.close();
  }

}