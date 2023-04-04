// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NotifyBadge extends StatelessWidget {
  double? width;
  double? height;
  double? fontSize;
  Color? color;
  NotifyBadge({
    Key? key,
    this.width,
    this.height,
    this.fontSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 2.0),
          BoxShadow(
              color: Colors.white, offset: Offset(1, -1), blurRadius: 5.0),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Icon(Icons.info, size: fontSize, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
