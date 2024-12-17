import 'package:counter/pages/counter/notifier/counter_notifier.dart';
import 'package:counter/pages/counter/notifier/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:simple_state_management/simple_state_management.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed:
                context.of<CounterNotifier, CounterState>().increaseCount,
            child: const Icon(Icons.exposure_plus_1),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed:
                context.of<CounterNotifier, CounterState>().decreaseCount,
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}

class CounterAsyncButtons extends StatelessWidget {
  const CounterAsyncButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed:
            context.of<CounterNotifier, CounterState>().increaseCountAsync,
            child: const Icon(Icons.exposure_plus_1),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed:
            context.of<CounterNotifier, CounterState>().decreaseCountAsync,
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
