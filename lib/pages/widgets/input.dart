import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({Key? key, required this.label, required this.hintText})
      : super(key: key);
  final label;
  final hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 15),
          hintText: hintText,
          border: OutlineInputBorder()),
    );
  }
}
