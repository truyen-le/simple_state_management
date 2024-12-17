import 'package:flutter/foundation.dart';

class SimpleStateNotifier<TValue> extends ChangeNotifier{
  TValue _state;

  SimpleStateNotifier(this._state);

  TValue get state => _state;

  void update(TValue newState) {
    if (_state == newState) {
      return;
    }

    _state = newState;
    notifyListeners();
  }
}