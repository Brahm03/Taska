import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taska/core/constants/colorConst.dart';

class IconConst {
  static SvgPicture email =
      SvgPicture.asset('assets/icons/message.svg', color: ColorConst.darkgrey);
  static SvgPicture lock =
      SvgPicture.asset('assets/icons/unlock.svg', color: ColorConst.darkgrey);
  static SvgPicture eye =
      SvgPicture.asset('assets/icons/eye.svg', color: ColorConst.darkgrey);
  static SvgPicture uploadImage =
      SvgPicture.asset('assets/icons/upload.svg', color: ColorConst.darkgrey);
  static IconData home = Icons.home;
  static IconData profile = Icons.person;
  static IconData search = Icons.search;
  static IconData calendar = Icons.calendar_month;
  static IconData bell = Icons.notifications;
  static SvgPicture google = SvgPicture.asset('assets/icons/google.svg');
  static SvgPicture facebook = SvgPicture.asset('assets/icons/facebook.svg');
  static SvgPicture apple = SvgPicture.asset('assets/icons/apple.svg');
  static SvgPicture add =
      SvgPicture.asset('assets/icons/add.svg', height: 100, width: 100);
  static SvgPicture edit = SvgPicture.asset('assets/icons/Edit.svg',
      color: ColorConst.kPrimaryColor);
  static SvgPicture security = SvgPicture.asset('assets/icons/security.svg');
  static SvgPicture info = SvgPicture.asset('assets/icons/info.svg');
  static SvgPicture workspace = SvgPicture.asset('assets/icons/airplay.svg');
  static SvgPicture moon = SvgPicture.asset('assets/icons/moon.svg');
  static IconData logout = Icons.logout;
  static IconData more = Icons.more_vert;
}
