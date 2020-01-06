import 'package:aula01/Entitys/Dogs.dart';
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

    List<Dog> dogs = [
      Dog("Dog X","assets/images/dog1.png"),
      Dog("Dog y","assets/images/dog2.png"),
      Dog("Dog z","assets/images/dog3.png"),
      Dog("Dog alfa","assets/images/dog4.png"),
      Dog("Dog beta","assets/images/dog5.png"),
    ];

    return Center(
      child: ListView.builder(
          itemExtent: 350,
          itemCount: dogs.length,
          itemBuilder: (BuildContext context, int index) {
            Dog dog = dogs[index];
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _image(dog.path),
                Text(dog.name,style: TextStyle(fontSize: 40, color: Colors.white, backgroundColor: Colors.black54),)
              ],
            );
          }),
    );
  }

  _image(String dog) {
    return Image.asset( dog,
      fit: BoxFit.cover,
    );
  }
}
