import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/radiusConst.dart';

class ConnectWIth extends StatelessWidget {
  final SvgPicture icon;
  final VoidCallback ontap;
  final double width;
  final double height;
  final Widget text;
  const ConnectWIth(
      {this.text = const SizedBox(),this.height = 70,
      this.width = 90,
      required this.ontap,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: PMconst.medium,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: ColorConst.kPrimaryColor,
                blurRadius: 20,
                spreadRadius: 5,
                offset: Offset(0, 10)),
            BoxShadow(
                color: Colors.white,
                blurRadius: 20,
                spreadRadius: 15,
                offset: Offset(-10, -10))
          ],
          borderRadius: BorderRadius.circular(RadiusConst.medium),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: MediaQuery.of(context).size.width * 0.015,),
            text
          ],
        ),
      ),
    );
  }
}
