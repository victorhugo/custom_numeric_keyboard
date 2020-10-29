import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part "SelectedInput.g.dart";

class SelectedInputObservable = _SelectedInputObservable with _$SelectedInputObservable;

abstract class _SelectedInputObservable with Store {

  @observable
  Key currentKey;  

  _SelectedInputObservable(Key selector){
    currentKey = selector;
  }
  @action
  void setCurrent(Key selector){
    currentKey = selector;
  }

}