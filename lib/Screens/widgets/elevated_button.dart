import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Elevatedbutton extends StatelessWidget {
  final String data;
  final void Function() onPressed;
  const Elevatedbutton(
      {super.key, required this.data, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(data),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          fixedSize:const Size(100, 30),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.all(Radius.circular(20))
              borderRadius: BorderRadius.circular(5))),
    );
  }
}
