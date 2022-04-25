import 'package:flutter/material.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';

class PicTaskInfoWidget extends StatefulWidget {
  final String title;
  final String date;
  final int index;
  final String image;
  const PicTaskInfoWidget(
      {required this.image,required this.date, required this.index, required this.title, Key? key})
      : super(key: key);

  @override
  State<PicTaskInfoWidget> createState() => _PicTaskInfoWidgetState();
}

class _PicTaskInfoWidgetState extends State<PicTaskInfoWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: PMconst.medium,
      height: size.height * 0.3,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(RadiusConst.medium),
          color: ColorConst.white),
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: ColorConst.kPrimaryColor,
                image: DecorationImage(image: NetworkImage(widget.image), fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(RadiusConst.medium),
                    topRight: Radius.circular(RadiusConst.medium))),
          )),
          Expanded(
              child: SizedBox(
            child: Padding(
              padding: PMconst.small,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontFamily: 'myfont',
                            fontWeight: FontWeight.bold,
                            fontSize: FontSizeconst.large),
                      ),
                      const Spacer(),
                      Icon(IconConst.more)
                    ],
                  ),
                  Text(
                    widget.date,
                    style: const TextStyle(
                        fontFamily: 'myfont', fontSize: FontSizeconst.medium),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
