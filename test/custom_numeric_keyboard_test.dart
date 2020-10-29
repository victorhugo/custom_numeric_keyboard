import 'package:custom_numeric_keyboard/components/NumericKeyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:custom_numeric_keyboard/custom_numeric_keyboard.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });

  testWidgets(
      "Cars are displayed with summary details, and selected car is highlighted blue.",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: NumericKeyboard(),
    ));
  });
}
