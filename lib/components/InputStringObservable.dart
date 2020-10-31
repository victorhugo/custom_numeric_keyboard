import 'package:mobx/mobx.dart';

part 'InputStringObservable.g.dart';

class InputStringObservable = _InputStringObservable
    with _$InputStringObservable;

abstract class _InputStringObservable with Store {
  int maxLimit = 0;

  bool isEnabled = true;

  _InputStringObservable({int max}) {
    maxLimit = max;
  }

  @observable
  String value = "";

  @action
  void add(String digit) {
    if (!isEnabled) return;
    if (value.length < maxLimit) {
      value += digit;
    }
  }

  @action
  void del() {
    if (!isEnabled) return;
    if (value.length > 0) {
      value = value.substring(0, value.length - 1);
    }
  }

  bool isEmpty() {
    return value.length == 0;
  }

  bool isCompleted() {
    return value.length == maxLimit;
  }
}
