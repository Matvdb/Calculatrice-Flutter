import 'package:flutter/material.dart';
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
  String _operateur = "";
  String total = "";
  double _resultat = 0;

  void reset(){
    _nombre1 = 0;
    _nombre2 = 0;
    total = "Entrer une valeur";
    _resultat = 0;
  }

  
  result(){
    setState(() {
      if (_operateur == "+"){
        _resultat = (_nombre1 + _nombre2);
        total = "$_resultat";
      } else if (_operateur == "-"){
        _resultat = (_nombre1 - _nombre2);
        total = "$_resultat";
      } else if (_operateur == "*"){
        _resultat = (_nombre1 * _nombre2);
        total = "$_resultat";
      } else if (_operateur == "/"){
        _resultat = (_nombre1 / _nombre2);
        total = "$_resultat";
      }
    });
  }


  void addition(){
    setState(() {
      double add = _nombre1 + _nombre2;
      _resultat = add;
    });
  }

  void soustraction(){
    setState(() {
      double soust = _nombre1 - _nombre2;
      _resultat = soust;
    });
  }

  void multipli(){
    setState(() {
      double multi = _nombre1 * _nombre2;
      _resultat = multi;
    });
  }

  void division(){
    setState(() {
      double divi = _nombre1 / _nombre2;
      _resultat = divi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculatrice"),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                afficher()
              ],
            ), 
          ),
          const Padding(padding: EdgeInsets.all(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.all(8)),
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      if(i == 0){
                      _nombre1 = 7;
                      total = "7";
                      _operateur;
                      i++;
                      } else if(i == 1){
                        _nombre2 = 7;
                        total = "7";
                        i--;
                      }
                    });
                  }, child: const Text("7")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    if(i == 0){
                      _nombre1 = 4;
                      total = "4";
                      _operateur;
                      i++;
                      } else if(i == 1){
                        _nombre2 = 4;
                        total = "4";
                        i--;
                      }
                    });
                  }, child: const Text("4")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    if(i == 0){
                      _nombre1 = 1;
                      total = "1";
                      i++;
                      } else if(i == 1){
                        _nombre2 = 1;
                        total = "1";
                        i--;
                      }
                    });
                  }, child: const Text("1")),
                ],
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                    if(i == 0){
                      _nombre1 = 8;
                      total = "8";
                      _operateur;
                      i++;
                      } else if(i == 1){
                        _nombre2 = 8;
                        total = "8";
                        i--;
                      }
                    });
                  }, child: const Text("8")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    if(i == 0){
                      _nombre1 = 5;
                      total = "5";
                      _operateur;
                      i++;
                      } else if(i == 1){
                        _nombre2 = 5;
                        total = "5";
                        i--;
                      }
                    });
                  }, child: const Text("5")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                     if(i == 0){
                      _nombre1 = 2;
                      total = "2";
                      _operateur;
                      i++;
                      } else if(i == 1){
                        _nombre2 = 2;
                        total = "2";
                        i--;
                      }
                    });
                  }, child: const Text("2")),
                ],
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                    if(i == 0){
                      _nombre1 = 9;
                      total = "9";
                      i++;
                      } else if(i == 1){
                        _nombre2 = 9;
                        total = "9";
                        i--;
                      }
                    });
                  }, child: const Text("9")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    if(i == 0){
                      _nombre1 = 6;
                      total = "6";
                      i++;
                      } else if(i == 1){
                        _nombre2 = 6;
                        total = "6";
                        i--;
                      }
                    });
                  }, child: const Text("6")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    if(i == 0){
                      _nombre1 = 3;
                      total = "3";
                      i++;
                      } else if(i == 1){
                        _nombre2 = 3;
                        total = "3";
                        i--;
                      }
                    });
                  }, child: const Text("3")),
                ],
              ),
              const Padding(padding: EdgeInsets.all(15)),
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _operateur = "+";
                      addition();
                    });
                  }, child: const Text("+")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _operateur = "-";
                      soustraction();
                    });
                  }, child: const Text("-")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _operateur = "*";
                      multipli();
                    });
                  }, child: const Text("*")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      _operateur = "/";
                    });
                  }, child: const Text("/")),
                  const Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(onPressed:(){
                    setState(() {
                      if (_nombre1 >= 0 && _nombre2 >= 0){
                        if (_operateur == "+"){
                          addition();
                          result();
                        } else if (_operateur == "-"){
                          soustraction();
                          result();
                        } else if (_operateur == "*"){
                          multipli();
                          result();
                        } else if (_operateur == "/"){
                          result();
                        }
                      } else {
                        total = "Veuillez ajouter un nombre";
                      }
                    });
                  }, child: const Text("=", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)),
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
              }, child: const Icon(Icons.restore)),
            ],
          ),    
        ],
      ),
      ),
    );
  }

  Widget afficher(){
    setState(() {
      if(i == 0){
        Text("$_nombre1" "$_operateur");
        if(i == 1){
          Text("$_nombre1" "$_nombre2");
        }
      }
    });
    return Text(total,style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold));
  }
  PopupMenuItem<MenusItem> buildItem(MenusItem item) => PopupMenuItem(
    child:
    Column(
      children: [
        RaisedButton(
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Parametre())),
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