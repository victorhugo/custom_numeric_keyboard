abstract class DigitValidor {
  bool isValid(String newValue);
}

class IntegerValidator extends DigitValidor {
  @override
  bool isValid(String newValue) {
    if (newValue == null) return false;
    final value = int.parse(newValue);
    if (value == null) return false;
    if (value < 0) return false;

    return true;
  }
}
