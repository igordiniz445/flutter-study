import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  String buttonText;
  Function onPressed;
  Color color;

  BlueButton(this.buttonText, this.onPressed, {this.color : Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      color: this.color,
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
