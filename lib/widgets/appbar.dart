import 'package:flutter/material.dart';
import 'package:taska/core/constants/fontSizeconst.dart';

class Appbar extends StatelessWidget {
  final Widget icon;
  const Appbar({required this.icon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      child: Row(
        children: [
          const Text(
            'Taska',
            style: TextStyle(
                fontFamily: 'myfont',
                fontWeight: FontWeight.bold,
                fontSize: FontSizeconst.large),
          ),
          Spacer(),
          icon,
        ],
      ),
    );
  }
}
