import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/menu_items.dart';
import 'package:flutter_application_1/ecran/parametre.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  Widget _calcButton(String btntxt, Color btncolor, Color txtcolor){
    return SizedBox(
      child: RaisedButton(
        onPressed: (){
          calcul(btntxt);
        },
        shape: const CircleBorder(),
        color: btncolor,
        padding: const EdgeInsets.all(20),
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), 
              child: Text("Calculatrice", style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
              ),
              ListTile(
                title: const Text('Calcul décimal'),
                onTap: () {
                },
              ),
              ListTile(
                title: const Text('Contact'),
                onTap: () {
                },
              ),
          ],
        ),
      ),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, 
              child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(padding: EdgeInsets.all(10.0),
              child: Text(text,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.black,
                fontSize: 50),
              ),)
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _calcButton('AC', Colors.grey.shade100, Colors.black),
              _calcButton('+/-', Colors.grey.shade100, Colors.black),
              _calcButton('%', Colors.grey.shade100, Colors.black),
              _calcButton('/', Colors.amber, Colors.white),
            ],
          ),  
          const SizedBox(
            height: 10,
          ),  
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _calcButton('7', Colors.grey, Colors.white),
              _calcButton('8', Colors.grey, Colors.white),
              _calcButton('9', Colors.grey, Colors.white),
              _calcButton('x', Colors.amber, Colors.white),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _calcButton('4', Colors.grey, Colors.white),
              _calcButton('5', Colors.grey, Colors.white),
              _calcButton('6', Colors.grey, Colors.white),
              _calcButton('-', Colors.amber, Colors.white),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _calcButton('1', Colors.grey, Colors.white),
              _calcButton('2', Colors.grey, Colors.white),
              _calcButton('3', Colors.grey, Colors.white),
              _calcButton('+', Colors.amber, Colors.white),
            ],
          ),  
          const SizedBox(
            height: 10,
          ),  
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Colors.grey,
                padding: const EdgeInsets.fromLTRB(34, 20, 110, 20),
                onPressed: (){

                },
                shape: const StadiumBorder(),
                child: const Text("0",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white
                  ),
                ),
              ),
              _calcButton('.', Colors.grey, Colors.white),
              _calcButton('=', Colors.amber, Colors.white),
            ],
          ),
        ],
      ),
      ),
      ),
    ); 
  }
  //Calculator logic
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

   void calcul(btnText) {
    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if( opr == '=' && btnText == '=') {
      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 
    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {
      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }
      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
     result = numOne / 100;
     finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }
    else if(btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();        
        finalResult = result;        
    } 
    else {
        result = result + btnText;
        finalResult = result;        
    }
    setState(() {
          text = finalResult;
        });

  }

  String add() {
         result = (numOne + numTwo).toString();
         numOne = double.parse(result);           
         return doesContainDecimal(result);
  }

  String sub() {
         result = (numOne - numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
          numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0))
         return result = splitDecimal[0].toString();
    }
    return result; 
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