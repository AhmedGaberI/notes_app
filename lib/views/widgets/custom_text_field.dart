import 'package:flutter/material.dart';

import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged})
      : super(key: key);

  final String hintText;
  final int maxLines;

  final void Function(String?)? onSaved;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (val) {
        if (val?.isEmpty ?? true) {
          return 'this field is required';
        }
        return null;
      },
      maxLines: maxLines,
      cursorColor: Colors.white,
      cursorRadius: const Radius.circular(10),
      decoration: InputDecoration(
        border: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        enabledBorder: buildBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
