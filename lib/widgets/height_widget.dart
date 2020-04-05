//import 'package:flutter/material.dart';
//import 'package:flutterbmi/constants/constant.dart';
//
//class HeightWidget extends StatelessWidget {
//
//  final int height = 190;
//  Function function;
//
//  HeightWidget({@required this.function});
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Text(
//          "HEIGHT",
//          style: kTextStyle,
//        ),
//        SizedBox(
//          height: 10.0,
//        ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.baseline,
//          textBaseline: TextBaseline.alphabetic,
//
//          children: <Widget>[
//            Text(height.toString(),
//              style: kNumberStyle,
//            ),
//            Text(" cm",style: kTextStyle,)
//
//          ],
//        ),
//        Slider(
//          onChanged: function,
//          value: height.toDouble(),
//          min: kMinHeight,
//          max: kMaxHeight,
//          activeColor: kAccentColor,
//          inactiveColor: kInActiveColor,
//        )
//      ],
//    );
//  }
//}
