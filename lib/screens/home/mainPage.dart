import 'package:flutter/material.dart';
import 'package:taska/core/components/allstyles.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';
import 'package:taska/screens/home/homePage.dart';
import 'package:taska/screens/home/profilePage.dart';
import 'package:taska/widgets/mybutton.dart';
import 'package:taska/widgets/mytextformField.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

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
              backgroundColor: Colors.transparent,
              context: context,
              builder: (widget) {
                return Container(
                  height: size.height * 0.6,
                  padding: PMconst.small,
                  margin: PMconst.medium,
                  decoration: BoxDecoration(
                      color: ColorConst.grey,
                      borderRadius: BorderRadius.circular(RadiusConst.medium)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Add New Task',
                          style: TextStyle(
                              fontFamily: 'myfont',
                              fontWeight: FontWeight.bold,
                              fontSize: FontSizeconst.large),
                        ),
                        const Divider(
                          color: ColorConst.black,
                        ),
                        SizedBox(
                          height: size.height * 0.040,
                        ),
                        MytextFormField(
                            controller: titleController,
                            decoration: AllStyles.textformFieldStyle(
                                hinttext: 'Title of you task',
                                icon: const SizedBox()),
                            validator: (v) {}),
                        SizedBox(
                          height: size.height * 0.020,
                        ),
                        MytextFormField(
                            controller: titleController,
                            decoration: AllStyles.textformFieldStyle(
                                preficIcon: Icon(IconConst.calendar),
                                hinttext: 'Date time', icon: IconButton(onPressed: (){}, icon: SizedBox())),
                            validator: (v) {}),
                        SizedBox(
                          height: size.height * 0.020,
                        ),
                        MytextFormField(
                            controller: titleController,
                            decoration: AllStyles.textformFieldStyle(
                                hinttext: 'exact time', icon: SizedBox()),
                            validator: (v) {}),
                        SizedBox(
                          height: size.height * 0.050,
                        ),
                        Mybutton(
                            onPressed: () {},
                            textcolor: ColorConst.blue,
                            buttonColor: ColorConst.kPrimaryColor,
                            text: 'Add New Task')
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      body: TabBarView(controller: tabController, children: [
        HomePage(),
        const ProfilePage(),
      ]),
      bottomNavigationBar: TabBar(
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
          ]),
    );
  }
}
