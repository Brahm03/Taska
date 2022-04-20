import 'package:flutter/material.dart';
import 'package:taska/core/components/allstyles.dart';

class MytextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final InputDecoration decoration;
  final bool obsecured;
  const MytextFormField({this.obsecured = false,required this.controller,required this.decoration,required this.validator,Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.060,
      child: TextFormField(
        obscureText: obsecured,
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        textAlign: TextAlign.start,
        validator: validator,
        decoration: decoration,
      ),
    );
  }
}