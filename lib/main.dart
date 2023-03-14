import 'package:flutter/material.dart';
import 'package:flutter_application_1/ecran/calculsApprofondis.dart';
import 'package:flutter_application_1/ecran/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/calculApp': (BuildContext context) => const CalcApprof(),
      },
    );
  }
}


