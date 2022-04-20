import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/radiusConst.dart';

class ConnectWIth extends StatelessWidget {
  final SvgPicture icon;
  final VoidCallback ontap;
  const ConnectWIth({required this.ontap,required this.icon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: PMconst.medium,
        height: MediaQuery.of(context).size.height * 0.080,
        width: MediaQuery.of(context).size.width * 0.2,
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
        child: icon,
      ),
    );
  }
}
