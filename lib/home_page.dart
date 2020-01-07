import 'package:aula01/pages/hello_page1.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/utils/drawer_list.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/Blue_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        centerTitle: true,
      ),
      body: home(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline),
        onPressed: ()=>print("botao flutuante clicado"),
      ),
      drawer: Drawer_list(),
    );
  }

  home() {
    return Builder(
      builder: (context) {
        this.context = context;
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _text(),
              ),
              _pageView(),
              _packButtons(context),
            ],
          ),
        );
      },
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
          BlueButton("ListView", () => changePage(context, HelloPage1())),
          BlueButton("Page 2", () => changePage(context, HelloPage2())),
          BlueButton("Page 3", () => changePage(context, HelloPage3())),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BlueButton("Snack", _onClickSnack),
          BlueButton("Dialog", _onClickDialog),
          BlueButton("Toast", _onClickToast),
        ],
      )
    ]);
  }

  _text() {
    return Text(
      "This is a flutter APP",
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
    Scaffold.of(this.context).showSnackBar(SnackBar(
      content: Text("THIS IS JUST A SNACK"),
      action: SnackBarAction(
        label: "ok",
        onPressed: () => print("Snack OK"),
        textColor: Colors.green,
      ),
    ));
  }

  _onClickDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          //WillPopScop é para o android nao cancelar o Dialog quando clicar no botao voltar
          return WillPopScope(
            //Async function cancela o POP do botao voltar
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Alerta !"),
              content: Text("Sua mensagem deu erro!"),
              actions: <Widget>[
                BlueButton("Cancelar", () {
                  pop(context);
                }),
                BlueButton("OK", () {
                  pop(context);
                }),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(msg: "Code With Flutter is EASY",gravity: ToastGravity.BOTTOM);
  }
}
