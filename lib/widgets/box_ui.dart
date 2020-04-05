import 'package:flutter/material.dart';

class GetBoxUI extends StatelessWidget {
  final Color color;
  final Widget widget;
  final Function function;

  GetBoxUI({@required this.color, this.widget,this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: function,

      child: Container(
          child: widget,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5.0)
          )
      ),
    );
  }
}