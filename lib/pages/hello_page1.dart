import 'package:aula01/Entitys/Dogs.dart';
import 'package:aula01/pages/Dog_description.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/Blue_button.dart';
import 'package:flutter/material.dart';

class HelloPage1 extends StatefulWidget {
  @override
  _HelloPage1State createState() => _HelloPage1State();
}

class _HelloPage1State extends State<HelloPage1> {
  BuildContext context;
  bool gridView = false;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 1"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                setState(() {
                  gridView = false;
                });
              },
              color: gridView ? Colors.white : Colors.black ,
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                gridView = true;
              });
            },
            color: _COR() ,
          )
        ],
      ),
      body: _body(),
    );
  }

  _COR(){
    if(gridView){
      return Colors.black;
    }else{
      return Colors.white;
    }
  }
  _body() {
    List<Dog> dogs = [
      Dog("Dog X", "assets/images/dog1.png"),
      Dog("Dog y", "assets/images/dog2.png"),
      Dog("Dog z", "assets/images/dog3.png"),
      Dog("Dog alfa", "assets/images/dog4.png"),
      Dog("Dog beta", "assets/images/dog5.png"),
    ];

    if (gridView) {
      return Center(
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            //itemExtent: 350,
            itemCount: dogs.length,
            itemBuilder: (BuildContext context, int index) {
              return _itemView(dogs, index);
            }),
      );
    } else {
      return Center(
        child: ListView.builder(
            itemExtent: 350, //itemExtent: 350,
            itemCount: dogs.length,
            itemBuilder: (BuildContext context, int index) {
              return _itemView(dogs, index);
            }),
      );
    }
  }

  _itemView(dogs, index) {
    Dog dog = dogs[index];
    return GestureDetector(
      onTap: (){
        push(context, DogDescription(dog.name,dog.path));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _image(dog.path),
          Align(
            alignment: Alignment(1, 1),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                dog.name,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _image(String dog) {
    return Image.asset(
      dog,
      fit: BoxFit.cover,
    );
  }
}
