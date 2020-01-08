
import 'package:flutter/material.dart';

class DogDescription extends StatelessWidget {
  String _nome;
  String _path;

  DogDescription(this._nome, this._path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Descrição do Dog"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            this._nome,
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
          Hero(
            tag: this._nome,
              child: Image.asset(_path)),
        ],
      ),
    );
  }
}
