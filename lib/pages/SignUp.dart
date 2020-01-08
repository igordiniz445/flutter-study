import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/Blue_button.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _context;
  bool _hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _login = TextEditingController();
  final _password = TextEditingController();
  final _password2 = TextEditingController();
  final _number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
        centerTitle: true,
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
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 50,
                        ),
                        Text(
                          "Create new user",
                          style: TextStyle(fontSize: 30),
                        ),
                      ]),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Full Name",
                      ),
                      //Controller pega os dados
                      controller: _name,
                      validator: (_name) {
                        if (_name.isEmpty) return "Campo Vazio";
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "User login",
                      ),
                      controller: _login,
                      validator: (login) {
                        if (login.isEmpty) return "Campo Vazio";
                        if (login.length <= 4) return "login muito curto";
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(_context).size.width - 180,
                        padding: EdgeInsets.only(left: 30),
                        child: TextFormField(
                          obscureText: _hidePassword,
                          decoration: InputDecoration(
                            labelText: "Password",
                          ),
                          controller: _password,
                          validator: (_password) {
                            if (_password.isEmpty) return "Campo Vazio";
                            if (_password.length < 6)
                              return "Senha deve contar mais que 6 caracteres";
                            return null;
                          },
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("Show Password"),
                          ),
                          Checkbox(
                            value: !_hidePassword,
                            onChanged: (bool value) {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    //width: MediaQuery.of(_context).size.width - 180,
                    padding: EdgeInsets.only(left: 30, right: 30),
                    margin: EdgeInsets.only(right: 120),
                    child: TextFormField(
                      obscureText: _hidePassword,
                      decoration: InputDecoration(
                        labelText: "Re-enter the password",
                      ),
                      controller: _password2,
                      validator: (_password2) {
                        if (_password.text.isNotEmpty) {
                          if (_password2 != _password.text)
                            return "Senhas estao diferentes";
                          return null;
                        } else {
                          return "Digite senha no campo superior";
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Phone number",
                        ),
                        obscureText: _hidePassword,
                        controller: _number,
                        validator: (_number) {
                          if (_number.isEmpty) return "Campo Vazio";
                          return null;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: BlueButton("Sign Up", () => _createUser()),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _createUser() {
    if(_formKey.currentState.validate()){
      pop(_context);
    }
  }
}
