// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SelectedInput.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectedInputObservable on _SelectedInputObservable, Store {
  final _$currentKeyAtom = Atom(name: '_SelectedInputObservable.currentKey');

  @override
  Key get currentKey {
    _$currentKeyAtom.reportRead();
    return super.currentKey;
  }

  @override
  set currentKey(Key value) {
    _$currentKeyAtom.reportWrite(value, super.currentKey, () {
      super.currentKey = value;
    });
  }

  final _$_SelectedInputObservableActionController =
      ActionController(name: '_SelectedInputObservable');

  @override
  void setCurrent(Key selector) {
    final _$actionInfo = _$_SelectedInputObservableActionController.startAction(
        name: '_SelectedInputObservable.setCurrent');
    try {
      return super.setCurrent(selector);
    } finally {
      _$_SelectedInputObservableActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentKey: ${currentKey}
    ''';
  }
}
