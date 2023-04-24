import 'package:flutter/material.dart';
import 'counterbloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final _counterBloc = CounterBloc();

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CounterBloc App')),
      body: Center(
        child: StreamBuilder(
          stream: _counterBloc.counter,
          initialData: 0,
          builder: (context, snapshot) => Text(
            'counter has been tapped' + snapshot.data.toString() + ' times',
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterBloc.incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
