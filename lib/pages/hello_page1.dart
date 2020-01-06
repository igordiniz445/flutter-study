import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/Blue_button.dart';
import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 1"),
      ),
      body: _body(),
    );
  }

  _body() {
    List<Widget> imgs = [
      _image("dog1.png"),
      _image("dog2.png"),
      _image("dog3.png"),
      _image("dog4.png"),
      _image("dog5.png"),
    ];

    return Center(
      child: ListView.builder(
          itemExtent: 350,
          itemCount: imgs.length,
          padding: EdgeInsets.all(16),
          itemBuilder: (BuildContext context, int index) {
            return imgs[index];
          }),
    );
  }

  _image(String dog) {
    return Image.asset(
      "assets/images/${dog}",
      fit: BoxFit.cover,
    );
  }
}
