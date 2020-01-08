import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  var _context;
  final _formKey = GlobalKey<FormState>();

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
                          "Create your user",
                          style: TextStyle(fontSize: 30),
                        ),
                      ]),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
