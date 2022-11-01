import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculatrice"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.all(8)),
          Container(
            alignment: Alignment.centerRight,
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.black26,
            child: Text(""),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: null, child: Text("7")),
              Padding(padding: EdgeInsets.all(8)),
              ElevatedButton(onPressed: null, child: Text("8")),
              Padding(padding: EdgeInsets.all(8)),
              ElevatedButton(onPressed: null, child: Text("9")),
              Padding(padding: EdgeInsets.all(8)),
              ElevatedButton(onPressed: null, child: Text("+"))
            ],
          ),        
        ],
      ),
    );
  }
}