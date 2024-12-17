import 'package:flutter/widgets.dart';

import 'simple_state_notifier.dart';

class InheritedSimpleState<TNotifier extends SimpleStateNotifier<TValue>,
    TValue> extends InheritedNotifier<TNotifier> {
  const InheritedSimpleState({
    required Widget child,
    required TNotifier notifier,
    Key? key,
  }) : super(key: key, child: child, notifier: notifier);

  static TNotifier of<TNotifier extends SimpleStateNotifier<TValue>, TValue>(
      BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            InheritedSimpleState<TNotifier, TValue>>()
        !.notifier!;
  }
}

class SimpleStateProvider<TNotifier extends SimpleStateNotifier<TValue>, TValue>
    extends StatefulWidget {
  final TNotifier Function(BuildContext context) create;
  final Widget child;

  const SimpleStateProvider({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);

  @override
  State<SimpleStateProvider> createState() =>
      _SimpleStateProviderState<TNotifier, TValue>();
}

class _SimpleStateProviderState<TNotifier extends SimpleStateNotifier<TValue>,
    TValue> extends State<SimpleStateProvider<TNotifier, TValue>> {
  late TNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = widget.create(context);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedSimpleState<TNotifier, TValue>(
      notifier: notifier,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    notifier.dispose();
  }
}
