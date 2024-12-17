<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A simple state management package.

## Features

- Notifier
- Provider
- Builder

## Getting started

### Installation
```yaml
dependencies:
  flutter:
    sdk: flutter

  simple_state_management:
    git:
      url: https://github.com/truyen-le/simple_state_management.git
      ref: master
```

## Usage

Please refer to `/example` folder for usage.

### Notifier
```dart
class CounterNotifier extends SimpleStateNotifier<CounterState> {
  CounterNotifier() : super(const CounterState(count: 0));

  void increaseCount() {
    final updateCount = state.count + 1;
    update(state.copyWith(count: updateCount));
  }
}
```

### Provider
```dart
@override
Widget build(BuildContext context) {
  return SimpleStateProvider<CounterNotifier, CounterState>(
    create: (context) => CounterNotifier(),
    child: Container(),
  );
}
```

## Builder
```dart
@override
Widget build(BuildContext context) {
  return SimpleStateBuilder<CounterNotifier, CounterState>(
    builder: (context, state) => Text('${state.count}'),
  );
}
```

## Calling function from context
```dart
context.of<CounterNotifier, CounterState>().increaseCount();
```
