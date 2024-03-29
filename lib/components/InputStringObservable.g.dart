// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InputStringObservable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InputStringObservable on _InputStringObservable, Store {
  final _$valueAtom = Atom(name: '_InputStringObservable.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_InputStringObservableActionController =
      ActionController(name: '_InputStringObservable');

  @override
  void add(String digit) {
    final _$actionInfo = _$_InputStringObservableActionController.startAction(
        name: '_InputStringObservable.add');
    try {
      return super.add(digit);
    } finally {
      _$_InputStringObservableActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue(String defValue) {
    final _$actionInfo = _$_InputStringObservableActionController.startAction(
        name: '_InputStringObservable.setValue');
    try {
      return super.setValue(defValue);
    } finally {
      _$_InputStringObservableActionController.endAction(_$actionInfo);
    }
  }

  @override
  void del() {
    final _$actionInfo = _$_InputStringObservableActionController.startAction(
        name: '_InputStringObservable.del');
    try {
      return super.del();
    } finally {
      _$_InputStringObservableActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
