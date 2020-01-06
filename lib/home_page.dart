import 'package:aula01/pages/hello_page1.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/Blue_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        centerTitle: true,
      ),
      body: home(context),
    );
  }

  home(context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _packButtons(context),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      height: 300,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: PageView(
        children: <Widget>[
          _image("dog1.png"),
          _image("dog2.png"),
          _image("dog3.png"),
          _image("dog4.png"),
          _image("dog5.png"),
        ],
      ),
    );
  }

  _packButtons(context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BlueButton( "ListView", () => changePage(context, HelloPage1())),
          BlueButton( "Page 2", () => changePage(context, HelloPage2())),
          BlueButton( "Page 3", () => changePage(context, HelloPage3())),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BlueButton( "Snack", _onClickSnack),
          BlueButton( "Dialog", _onClickDialog),
          BlueButton( "Toast", _onClickToast),
        ],
      )
    ]);
  }

  _text() {
    return Text(
      "This is my first app",
      style: TextStyle(
        color: Colors.blueAccent,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }



  _image(String dog) {
    return Image.asset(
      "assets/images/${dog}",
      fit: BoxFit.contain,
    );
  }

  void changePage(BuildContext context, Widget widget) async {
    String string = await push(context, widget);
    print(string);
  }

  _onClickSnack() {
    print("Clicquei no snack");
  }

  _onClickDialog() {
  }

  _onClickToast() {
  }
}
