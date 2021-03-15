import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hint, this.validator, this.onSaved, this.obsecure = false});

  final FormFieldSetter<String> onSaved;
  final String hint;
  final FormFieldValidator<String> validator;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]))),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        obscureText: obsecure,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
                fontFamily: 'MontserratAlternates', color: Colors.grey[400])),
      ),
    );
  }
}
