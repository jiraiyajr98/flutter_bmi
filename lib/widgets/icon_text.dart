import 'package:flutter/material.dart';
import 'package:flutterbmi/constants/constant.dart';



class IconAndText extends StatelessWidget {
  final IconData iconData;
  final String text;

  IconAndText({@required this.iconData, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kTextStyle,
        )
      ],
    );
  }
}