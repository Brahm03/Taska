import 'package:flutter/material.dart';
import 'package:taska/core/components/allstyles.dart';

class MytextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final InputDecoration decoration;
  final bool obsecured;
  final int maxlength;
  final int minlength;
  var ontap;
  var search;
  final bool enabled;
  MytextFormField(
      {this.ontap,this.search,this.enabled = true,
      this.minlength = 1,
      this.maxlength = 1,
      this.obsecured = false,
      required this.controller,
      required this.decoration,
      required this.validator,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.064,
      child: TextFormField(
        onTap: ontap,
        onChanged: search,
        enabled: enabled,
        maxLength: maxlength,
        minLines: minlength,
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
