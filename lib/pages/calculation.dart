import 'package:flutter/material.dart';
import 'package:flutterbmi/constants/constant.dart';

class Calculation extends StatelessWidget {

  final String bmiResult;
  final String result;
  final String feedBack;

  Calculation({@required this.bmiResult,@required this.result,@required this.feedBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  result,
                  style: TextStyle(
                      color: Color(0xFF21C46F),
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700),
                ),

                Text(
                  bmiResult,
                  style: TextStyle(fontSize: 90.0, fontWeight: FontWeight.w800),
                ),

                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(feedBack,style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  ),),
                ),

              ],
            ),
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: kDefaultNotSelected,
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            child: Center(
                child: Text(
              "RE-CALCULATE",
              style: kResultStyle,
            )),
            color: kAccentColor,
            height: kButtonHeight,
          ),
        )
      ],
    );
  }


}
