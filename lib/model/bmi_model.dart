import 'dart:math';

import 'package:flutter/cupertino.dart';

class BMIModel {

  int height;
  int weight;
  double _bmi;


  BMIModel({@required this.height,@required this.weight});

  String calculateBmi()
  {
    _bmi = (weight)/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String result()
  {

        if(_bmi <= 17.5)
          return "Under Weight";
        else if(_bmi <= 24.9)
          return "Normal";
        else
          return "OverWeight";

  }

  String feedBack()
  {

    if(_bmi <= 17.5)
      return "Your BMI is quiet low, you should eat more!";
    else if(_bmi <= 24.9)
      return "Your BMI is normal, Good Job!";
    else
      return "You have a higher than normal body weight. Try to exercise more. ";

  }

}