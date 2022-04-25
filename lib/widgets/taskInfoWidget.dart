import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';
import 'package:taska/provider/checkBoxprovider.dart';
import 'package:taska/provider/writeUserInfoProvider.dart';
import 'package:taska/widgets/mycheckBox.dart';

class TaskInfoWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  bool check;
  final int index;
  final BuildContext context;
  TaskInfoWidget(
      {required this.context,
      required this.index,
      required this.check,
      required this.subtitle,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  State<TaskInfoWidget> createState() => _TaskInfoWidgetState();
}

class _TaskInfoWidgetState extends State<TaskInfoWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserInfoProvider>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.010),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
      height: size.height * 0.090,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusConst.medium),
          color: ColorConst.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.subtitle,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'myfont',
                    color: ColorConst.black,
                    fontSize: FontSizeconst.medium),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontFamily: 'myfont',
                    color: ColorConst.darkgrey,
                    fontSize: FontSizeconst.small),
              ),
            ],
          ),
          const Spacer(),
          MycheckBox(
            onchanged: (v) async {
              widget.check = !widget.check;
              await context
                  .read<UserInfoProvider>()
                  .changeDone(widget.index, context, widget.check);
              context.read<UserInfoProvider>().delateFromStore(widget.index);
              setState(() {});
            },
            value: widget.check,
          )
        ],
      ),
    );
  }
}
