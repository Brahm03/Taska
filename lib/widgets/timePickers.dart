import 'package:flutter/material.dart';

class TimePickers {
  static datetimer(BuildContext context) {
    return showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.utc(2030));
  }

  static time(BuildContext context) {
    return showTimePicker(
        context: context, initialTime: const TimeOfDay(hour: 9, minute: 00));
  }
}
