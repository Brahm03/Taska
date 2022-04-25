import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/components/allstyles.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';
import 'package:taska/provider/editProfileImage.dart';
import 'package:taska/provider/writeUserInfoProvider.dart';
import 'package:taska/screens/home/homePage.dart';
import 'package:taska/screens/home/profilePage.dart';
import 'package:taska/service/FirebaseService.dart';
import 'package:taska/widgets/addNewProjectWidget.dart';
import 'package:taska/widgets/mybutton.dart';
import 'package:taska/widgets/mytabbar.dart';
import 'package:taska/widgets/mytextformField.dart';
import 'package:taska/widgets/timePickers.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final _key = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController timeController = TextEditingController();
  XFile? taskImage;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: IconConst.add,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (widget) {
                  return AddNewProjectWidget(key1: _key,size: size, titleController: titleController, dateController: dateController, description: description, timeController: timeController);
                });
          },
        ),
        body: TabBarView(controller: tabController, children: [
          HomePage(),
          ProfilePage(),
        ]),
        bottomNavigationBar: MyTabbar(tabController: tabController!));
  }
}
