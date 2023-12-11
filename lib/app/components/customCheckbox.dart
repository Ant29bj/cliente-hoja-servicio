import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatefulWidget {
  bool checked;
  CustomCheckBox({super.key, required this.checked});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: widget.checked ? true : false,
        onChanged: (bool? value) {
          setState(() {
            widget.checked = value!;
          });
        });
  }
}
