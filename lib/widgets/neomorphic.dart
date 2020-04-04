import 'package:flutter/material.dart';

class NeomorphicTextField extends StatelessWidget {
  final String hintText;
  final Function onChange;
  final bool obscureText;

  NeomorphicTextField({
    @required this.hintText,
    @required this.onChange,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0XFFEFF3F6),
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(6, 2),
                blurRadius: 6.0,
                spreadRadius: 3.0),
            BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.9),
                offset: Offset(-6, -2),
                blurRadius: 6.0,
                spreadRadius: 3.0)
          ]),
      child: TextField(
        obscureText: this.obscureText,
        onChanged: this.onChange,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: this.hintText,
            contentPadding: const EdgeInsets.only(left: 16.0)),
      ),
    );
  }
}
