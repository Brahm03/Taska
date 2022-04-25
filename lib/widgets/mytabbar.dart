import 'package:flutter/material.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/colorConst.dart';

class MyTabbar extends StatelessWidget {
  final TabController tabController;
  const MyTabbar({required this.tabController,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        unselectedLabelColor: ColorConst.blue,
        controller: tabController,
        tabs: [
          Tab(
              icon: Icon(
            IconConst.home,
            color: ColorConst.kPrimaryColor,
          )),
          Tab(
            icon: Icon(
              IconConst.profile,
              color: ColorConst.kPrimaryColor,
            ),
          )
        ]);
  }
}
