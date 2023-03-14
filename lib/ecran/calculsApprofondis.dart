import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/menu_items.dart';

class CalcApprof extends StatefulWidget {
  const CalcApprof({Key? key}) : super(key: key);

  @override
  State<CalcApprof> createState() => _CalcApprofState();
}

class _CalcApprofState extends State<CalcApprof> {
  
  // Generate calculator buttons
  Widget _calcButton(String btntxt, Color btncolor, Color txtcolor){
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        backgroundColor: btncolor,
        ),
        onPressed: (){
          calcul(btntxt);
        },
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
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        centerTitle: true,
        title: const Text("Calcul approfondi", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      ),
      // Creation background color and alignement buttons
      body: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.black,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, 
              child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(text,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.white,
                  fontSize: 50),
                  ),
                ),
              ),
            ],
          ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _calcButton('AC', Colors.grey.shade100, Colors.black),
              const Padding(padding: EdgeInsets.all(5)),
              _calcButton('+/-', Colors.grey.shade100, Colors.black),
              const Padding(padding: EdgeInsets.all(5)),
              _calcButton('%', Colors.grey.shade100, Colors.black),
              const Padding(padding: EdgeInsets.all(5)),
              _calcButton('/', Colors.amber, Colors.white),
            ],
          ),  
          const SizedBox(
            height: 10,
          ),  
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _calcButton('7', Colors.grey, Colors.white),
              const Padding(padding: EdgeInsets.all(4)),
              _calcButton('8', Colors.grey, Colors.white),
              const Padding(padding: EdgeInsets.all(4)),
              _calcButton('9', Colors.grey, Colors.white),
              const Padding(padding: EdgeInsets.all(4)),
              _calcButton('x', Colors.amber, Colors.white),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             _calcButton('4', Colors.grey, Colors.white),
              const Padding(padding: EdgeInsets.all(4)),
              _calcButton('5', Colors.grey, Colors.white),
              const Padding(padding: EdgeInsets.all(4)),
              _calcButton('6', Colors.grey, Colors.white),
              const Padding(padding: EdgeInsets.all(4)),
              _calcButton('-', Colors.amber, Colors.white),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _calcButton('1', Colors.grey, Colors.white),
              const Padding(padding: EdgeInsets.all(8)),
              _calcButton('2', Colors.grey, Colors.white),
              const Padding(padding: EdgeInsets.all(6)),
              _calcButton('3', Colors.grey, Colors.white),
              const Padding(padding: EdgeInsets.all(3)),
              _calcButton('+', Colors.amber, Colors.white),
            ],
          ),  
          const SizedBox(
            height: 10,
          ),  
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(34, 20, 110, 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                backgroundColor: Colors.grey,
                ),
                onPressed: (){
                  calcul("0");
                },
                child:const Text("0",
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
  //Calculs
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
}