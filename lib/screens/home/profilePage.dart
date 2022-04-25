import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';
import 'package:taska/provider/editProfileImage.dart';
import 'package:taska/provider/writeUserInfoProvider.dart';
import 'package:taska/service/fure_store_service.dart';
import 'package:taska/widgets/appbar.dart';
import 'package:taska/widgets/logOutWidget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: PMconst.medium,
      child: SizedBox(
        child: Column(
          children: [
            Appbar(icon: Icon(IconConst.more)),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              MyFireStore.infoOfUser['image_url'].toString()),
                          radius: RadiusConst.extralarge + 20,
                          backgroundColor: ColorConst.darkgrey,
                        ),
                        Positioned(
                            bottom: 0,
                            left: MediaQuery.of(context).size.width * 0.20,
                            child: CircleAvatar(
                              radius: RadiusConst.small,
                              backgroundColor: ColorConst.blue,
                              child: IconButton(
                                icon: IconConst.edit,
                                onPressed: () async {
                                  await context
                                      .read<MyImageprovider>()
                                      .pickImage();
                                  context
                                      .read<UserInfoProvider>()
                                      .editProfilePic(
                                          Provider.of<MyImageprovider>(context,
                                                  listen: false)
                                              .image!);
                                },
                              ),
                            ))
                      ],
                    ),
                    Text(
                      MyFireStore.infoOfUser['fullname'].toString(),
                      style: const TextStyle(
                          fontFamily: 'myfont',
                          fontWeight: FontWeight.bold,
                          fontSize: FontSizeconst.medium),
                    ),
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    Text(
                      MyFireStore.infoOfUser['username'].toString(),
                      style: const TextStyle(
                          fontFamily: 'myfont',
                          fontWeight: FontWeight.w200,
                          fontSize: FontSizeconst.small),
                    ),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              MyFireStore.infoOfUser['tasks'].length.toString(),
                              style: const TextStyle(
                                  fontFamily: 'myfont',
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizeconst.medium),
                            ),
                            const Text(
                              'Projects',
                              style: TextStyle(fontFamily: 'myfont'),
                            ),
                          ],
                        ),
                        Container(
                            height: size.height * 0.040,
                            width: size.width * 0.002,
                            color: ColorConst.darkgrey),
                        Column(
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(
                                  fontFamily: 'myfont',
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizeconst.medium),
                            ),
                            Text(
                              'Tasks',
                              style: TextStyle(fontFamily: 'myfont'),
                            ),
                          ],
                        ),
                        Container(
                            height: size.height * 0.040,
                            width: size.width * 0.002,
                            color: ColorConst.darkgrey),
                        Column(
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(
                                  fontFamily: 'myfont',
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizeconst.medium),
                            ),
                            Text(
                              'Groups',
                              style: TextStyle(fontFamily: 'myfont'),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
            Expanded(
                flex: 6,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, __) {
                    return ListTile(
                      onTap: __ == 5
                          ? () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          RadiusConst.medium)),
                                  context: context,
                                  builder: (widget) {
                                    return LogOutWidget(size: size);
                                  });
                            }
                          : () {},
                      trailing: __ == 4
                          ? Switch(value: false, onChanged: (v) {})
                          : const SizedBox(),
                      leading: _icons[__].runtimeType != SvgPicture
                          ? __ == 5
                              ? IconButton(
                                  tooltip: 'Log out',
                                  splashRadius: 1,
                                  onPressed: () {},
                                  icon: Icon(
                                    _icons[__],
                                    color: ColorConst.red,
                                  ))
                              : IconButton(
                                  onPressed: () {}, icon: Icon(_icons[__]))
                          : IconButton(onPressed: () {}, icon: _icons[__]),
                      title: Text(
                        _info[__],
                        style: TextStyle(
                            fontFamily: 'myfont',
                            color: __ == 5 ? ColorConst.red : ColorConst.black),
                      ),
                    );
                  },
                  itemCount: _info.length,
                )),
          ],
        ),
      ),
    );
  }

  final List<String> _info = [
    'Workspace',
    'Edit Profile',
    'Notification',
    'Help',
    'Dark Theme',
    'Log out',
  ];

  final List _icons = [
    IconConst.workspace,
    IconConst.profile,
    IconConst.bell,
    IconConst.info,
    IconConst.moon,
    IconConst.logout
  ];
}
