library custom_numeric_keyboard;

import 'package:custom_numeric_keyboard/components/InputStringObservable.dart';
import 'package:custom_numeric_keyboard/components/SelectedInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NumericKeyboard extends StatefulWidget {
  NumericKeyboard({Key key}) : super(key: key);

  @override
  _NumericKeyboardState createState() => _NumericKeyboardState();
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  TextSelector currentInput;
  TextSelector input1;

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
      nButton(1, currentInput),
      nButton(2, currentInput),
      nButton(3, currentInput),
      nButton(4, currentInput),
      nButton(5, currentInput),
      nButton(6, currentInput),
      nButton(7, currentInput),
      nButton(8, currentInput),
      nButton(9, currentInput),
      Container(),
      nButton(0, currentInput),
      // delButton(),
    ];
    return list;
  }

  Widget nButton(int index, TextSelector text) {
    return Center(
      child: FlatButton(
        child: Center(
          child: Text("$index",
              style: TextStyle(
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
}

typedef TapSelectorCallback = void Function(Key key);

class TextSelector extends StatefulWidget {
  const TextSelector(
      {Key key,
      @required this.input,
      @required this.onTap,
      @required this.selected})
      : super(key: key);

  final InputStringObservable input;
  final TapSelectorCallback onTap;
  final SelectedInputObservable selected;

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
    return SizedBox(
      height: 45,
      child: GestureDetector(
        onTap: () {
          this.widget.onTap(this.widget.key);
          // setState(() {
          //   setSelected(true);
          // });
        },
        child: Observer(
          builder: (context) {
            return Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                    flex: 8,
                    child: Observer(
                        builder: (context) => Text(
                              widget.input.value,
                              //style: R.fontStyleRegular(size: 20)
                            ))
                    // TextFormField(
                    //   obscureText: true,
                    //   onEditingComplete: () => FocusScope.of(context).nextFocus(), //Ayuda a saltar al siguiente
                    //     // controller: _emailTextController,
                    //     // validator: _validateEmail,
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //         //labelText: "Usuario",
                    //         hintText: label,
                    //         // labelStyle: GoogleFonts.notoSans(fontWeight: FontWeight.w400, fontSize: 15)
                    //         )
                    //   ),
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}
