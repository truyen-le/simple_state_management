import 'package:counter/pages/counter/notifier/counter_notifier.dart';
import 'package:counter/pages/counter/notifier/counter_state.dart';
import 'package:counter/pages/counter/widgets/counter_buttons.dart';
import 'package:flutter/material.dart';
import 'package:simple_state_management/simple_state_management.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleStateProvider<CounterNotifier, CounterState>(
      create: (context) => CounterNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SimpleStateBuilder<CounterNotifier, CounterState>(
                builder: (context, state) => Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Normal'),
              const CounterButtons(),
              const Text('Async'),
              const CounterAsyncButtons(),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
