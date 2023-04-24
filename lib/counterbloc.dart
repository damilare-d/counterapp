//with bloc i have to seperate the vusiness ui from the logic
//by creating a class that serves as a middleman between the ui
//and logic

import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _counter = 0;

  final _controlcounter = BehaviorSubject<int>.seeded(0);

  Stream<int> get counter => _controlcounter.stream;
  //we create a getter counter that returns a stream  of typer int
  //of the counter

  void incrementCounter() {
    _counter++;
    _controlcounter.sink.add(_counter);
    // this function does two things
    //first it increases the value of the counter value by one
    //then it pushes the just pdated counter integer variable to
    // the control counter with the sink.add method
  }

  void dispose() {
    _controlcounter.close();
    //the function dispose closes the controlcounter when its no longer needed
  }
}
