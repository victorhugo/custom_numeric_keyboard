import 'package:mobx/mobx.dart';

part 'InputStringObservable.g.dart';

class InputStringObservable = _InputStringObservable
    with _$InputStringObservable;

abstract class _InputStringObservable with Store {
  int maxLimit = 0;

  bool isEnabled = true;

  _InputStringObservable({int max, String placeholder = ""}) {
    maxLimit = max;
    value = placeholder;
  }

  @observable
  String value = "";

  @action
  void add(String digit) {
    if (!isEnabled) return;
    if (value.length < maxLimit) {
      var numValue = double.parse(value);
      if (numValue == 0) {
        value = digit;
      } else {
        value += digit;
      }
    }
  }

  @action
  void setValue(String defValue) {
    value = defValue;
  }

  @action
  void del() {
    if (!isEnabled) return;
    if (value.length > 0) {
      value = value.substring(0, value.length - 1);
      if (value.length == 0) {
        value = "0";
      }
    }
  }

  bool isEmpty() {
    return value.length == 0;
  }

  bool isCompleted() {
    return value.length == maxLimit;
  }
}
