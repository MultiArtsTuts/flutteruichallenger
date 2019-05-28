import 'dart:async';
import 'package:food_restaurant/blocs/bloc_provider.dart';

class CounterBloc implements BlocBase {
  int _counter;
  bool _isSelected;

  // Stream to handle the counter
  StreamController<int> _counterController = StreamController<int>();
  Sink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  StreamController<bool> _selectedController = StreamController<bool>();
  Sink<bool> get _inSelected => _selectedController.sink;
  Stream<bool> get outSelected => _selectedController.stream;

  CounterBloc() {
    _counter = 0;
    _isSelected = false;
  }

  @override
  void dispose() {
    _counterController.close();
    _selectedController.close();
  }

  void increment() {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

   void decrement() {
    _counter = _counter - 1;
    _inAdd.add(_counter);
  }

  void changeSelected(){
    if(!_isSelected)
    {
      _isSelected = true;
    _inSelected.add(_isSelected);
    }
    else
    _isSelected = false;
  }
}