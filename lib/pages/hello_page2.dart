import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/Blue_button.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 2"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Container(
          color: Colors.white, child: BlueButton("Voltar", _onClickButton)),
    );
  }

  _onClickButton() {
    pop(context, extras: "KEY_");
  }
}
