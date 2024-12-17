import 'package:flutter/widgets.dart';

import 'simple_state_notifier.dart';
import 'simple_state_provider.dart';

class SimpleStateBuilder<TNotifier extends SimpleStateNotifier<TValue>, TValue>
    extends StatefulWidget {
  final Widget Function(BuildContext context, TValue state) builder;

  const SimpleStateBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<SimpleStateBuilder> createState() =>
      _SimpleStateBuilderState<TNotifier, TValue>();
}

class _SimpleStateBuilderState<TNotifier extends SimpleStateNotifier<TValue>,
    TValue> extends State<SimpleStateBuilder<TNotifier, TValue>> {
  @override
  Widget build(BuildContext context) {
    var notifier = InheritedSimpleState.of<TNotifier, TValue>(context);

    return ListenableBuilder(
      listenable: notifier,
      builder: (context, _) => widget.builder(context, notifier.state),
    );
  }
}

extension BuildContextSimpleStateExtensions on BuildContext {
  TNotifier of<TNotifier extends SimpleStateNotifier<TValue>, TValue>() {
    return dependOnInheritedWidgetOfExactType<
            InheritedSimpleState<TNotifier, TValue>>()!
        .notifier!;
  }
}
