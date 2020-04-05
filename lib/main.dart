import 'package:flutter/material.dart';
import 'package:flutterbmi/pages/Home.dart';

main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
          appBar: AppBar(
            title: Text("BMI  CALCULATOR"),
            centerTitle: true,
          ),
          body: Home()
      ),
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF090c22),
          scaffoldBackgroundColor: Color(0xFF090c22)),
    );
  }
}
