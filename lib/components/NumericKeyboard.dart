library custom_numeric_keyboard;

import 'package:custom_numeric_keyboard/components/InputStringObservable.dart';
import 'package:custom_numeric_keyboard/components/SelectedInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NumericKeyboard extends StatefulWidget {
  NumericKeyboard(
      {Key key,
      @required this.currentInput,
      this.buttonStyle,
      this.tintColor = Colors.black,
      this.withFloat = false})
      : super(key: key);

  final TextSelector currentInput;
  final TextStyle buttonStyle;
  final Color tintColor;
  final bool withFloat;

  @override
  _NumericKeyboardState createState() => _NumericKeyboardState();
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return keyboard(buttonSForKeyboard());
  }

  Widget keyboard(List<Widget> buttons) {
    return GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(5),
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisSpacing: 45,
        mainAxisSpacing: 8,
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: buttons);
  }

  List<Widget> buttonSForKeyboard() {
    var list = <Widget>[
      nButton(1, widget.currentInput),
      nButton(2, widget.currentInput),
      nButton(3, widget.currentInput),
      nButton(4, widget.currentInput),
      nButton(5, widget.currentInput),
      nButton(6, widget.currentInput),
      nButton(7, widget.currentInput),
      nButton(8, widget.currentInput),
      nButton(9, widget.currentInput),
      widget.withFloat ? textButton(".", widget.currentInput) : Container(),
      nButton(0, widget.currentInput),
      delButton(),
    ];
    return list;
  }

  Widget nButton(int index, TextSelector text) {
    return Center(
      child: FlatButton(
        child: Center(
          child: Text("$index",
              style: widget.buttonStyle != null
                  ? widget.buttonStyle
                  : TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30)),
        ),
        onPressed: () {
          setState(() {
            if (text != null) {
              text.input.add("$index");
            }
          });
          print("Presionado $index");
        },
      ),
    );
  }

  Widget textButton(String symbol, TextSelector text) {
    return Center(
      child: FlatButton(
        child: Center(
          child: Text("$symbol",
              style: widget.buttonStyle != null
                  ? widget.buttonStyle
                  : TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30)),
        ),
        onPressed: () {
          setState(() {
            if (text != null) {
              text.input.add("$symbol");
            }
          });
          print("Presionado $symbol");
        },
      ),
    );
  }

  Widget delButton() {
    return FlatButton(
      child: Icon(
        Icons.arrow_back_ios,
        color: widget.tintColor,
      ),
      onPressed: () {
        widget.currentInput.input.del();
      },
    );
  }
}

typedef TapSelectorCallback = void Function(Key key);

class TextSelector extends StatefulWidget {
  const TextSelector(
      {Key key,
      @required this.input,
      @required this.onTap,
      @required this.selected,
      this.style})
      : super(key: key);

  final InputStringObservable input;
  final TapSelectorCallback onTap;
  final SelectedInputObservable selected;
  final TextStyle style;

  @override
  _TextSelectorState createState() => _TextSelectorState();
}

class _TextSelectorState extends State<TextSelector> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  // void setSelected(bool selected){
  //   setState(() {
  //     isSelected = selected;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          this.widget.onTap(this.widget.key);
          // setState(() {
          //   setSelected(true);
          // });
        },
        child: Observer(
            builder: (context) => Text(widget.input.value, style: widget.style
                //style: R.fontStyleRegular(size: 20)
                )));
  }
}
