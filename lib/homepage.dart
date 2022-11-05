import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/calcul.dart';
import 'package:flutter_application_1/data/menu_items.dart';
import 'package:flutter_application_1/parametre.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 0;
  double _nombre1 = 0;
  double _nombre2 = 0;
  String total = "";
  Text _resultat = Text("");

  void reset(){
    _nombre1 = 0;
    _nombre2 = 0;
    total = "";
  }

  void addition(){
    double add = Calculs.calculAddition(_nombre1, _nombre2);
  }
  void calculer(){
    double soustraction = Calculs.calculSoustraction(_nombre1, _nombre2);
    double division = Calculs.calculDivision(_nombre1, _nombre2);
    double multiplication = Calculs.calculMultiplication(_nombre1, _nombre2);
    setState(() {
      _resultat = Text(total);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculatrice"),
        centerTitle: true,
        actions: [
          Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white38,
                  ),
                  height: 10,
                  width: 50,
                  child: PopupMenuButton<MenusItem>(
                  itemBuilder: (context) => [
                    ...MenusItems.itemsFirst.map(buildItem).toList(),
                ],),
                ),
        ],
      ),
      body: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.lightBlue,
            child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.all(8)),
          Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.black26),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(total, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
          ),
          const Padding(padding: EdgeInsets.all(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(8)),
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                    _nombre1 = 7;
                    total = "7";
                    });
                  }, child: Text("7")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    _nombre1 = 8;
                    total = "8";
                    });
                  }, child: Text("4")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    _nombre1 = 1;
                    total = "1";
                    });
                  }, child: Text("1")),
                ],
              ),
              Padding(padding: EdgeInsets.all(8)),
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                    _nombre1 = 8;
                    total = "8";
                    });
                  }, child: Text("8")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    _nombre1 = 5;
                    total = "5";
                    });
                  }, child: Text("5")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    _nombre1 = 2;
                    total = "2";
                    });
                  }, child: Text("2")),
                ],
              ),
              Padding(padding: EdgeInsets.all(8)),
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                    _nombre1 = 9;
                    total = "9";
                    });
                  }, child: Text("9")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    _nombre1 = 6;
                    total = "6";
                    });
                  }, child: Text("6")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    _nombre1 = 3;
                    total = "3";
                    });
                  }, child: Text("3")),
                ],
              ),
              Padding(padding: EdgeInsets.all(15)),
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      calculer();
                    });
                  }, child: Text("+")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: calculer, child: Text("-")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: calculer, child: Text("*")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: calculer, child: Text("/")),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: null, child: Text("=", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)),
                ],
              ),
            ],
          ),    
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  reset();
                });
              }, child: Icon(Icons.restore)),
            ],
          ),    
        ],
      ),
      ),
    );
  }
  PopupMenuItem<MenusItem> buildItem(MenusItem item) => PopupMenuItem(
    child:
    Column(
      children: [
        RaisedButton(
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Parametre())),
        child: Row(
          children: [
            Icon(
                item.icon, color: Colors.black, 
                size: 20,
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Text(item.text), 
          ],
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        splashColor: Colors.lightBlue,
        ),
        ],
        ), 
    );
}