import 'package:aula01/pages/SignUp.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/Blue_button.dart';
import 'package:aula01/widgets/Flat_button.dart';
import 'package:flutter/material.dart';



class Login extends StatelessWidget {
  final _userText = TextEditingController();
  final _passwordText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login Screen",
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return Builder(builder: (context) {
      this._context = context;
      return Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _header(),
                  _loginForm(),
                  _passwordForm(),
                  _loginButton(),
                  _signUpButton(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _logUser() {
    print("User = ${_userText.text} | Password = ${_passwordText.text}");
    if (_formKey.currentState.validate()) {
      if (_userText.text != "igor") {
        Scaffold.of(_context).showSnackBar(SnackBar(
          content: Text("Logado como ${_userText.text}"),
          action: SnackBarAction(
            label: "ok",
            onPressed: () => print("ok"),
          ),
        ));
      }
    }
  }

  _signUp() {
    push(_context, SignUp());
  }

  _header() {
    return Column(
      children: <Widget>[
        FlutterLogo(
          size: 100,
        ),
        Text(
          "Flutter App",
          style:
          TextStyle(fontSize: 34, color: Colors.blueAccent),
        ),
      ],
    );
  }

  _loginForm() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Username",
        ),
        controller: _userText,
        validator: (_userText) {
          if (_userText.isEmpty) return "Digite Seu usuário";
          return null;
        },
      ),
    );
  }

  _passwordForm() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
        ),
        controller: _passwordText,
        validator: (_passwordText) {
          if (_passwordText.isEmpty) return "Digite sua senha";
          return null;
        },
      ),
    );
  }

  _loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: BlueButton("Login", () => _logUser()),
    );
  }

  _signUpButton() {
    return Container(
      //margin: EdgeInsets.only(top: 5),
      child: FlatSimpleButton("Create account", () => _signUp()),
    );
  }
}
