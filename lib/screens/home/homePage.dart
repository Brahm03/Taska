import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/components/allstyles.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/provider/seeAllProvider.dart';
import 'package:taska/provider/writeUserInfoProvider.dart';
import 'package:taska/service/FirebaseService.dart';
import 'package:taska/service/fure_store_service.dart';
import 'package:taska/widgets/appbar.dart';
import 'package:taska/widgets/mytextformField.dart';
import 'package:taska/widgets/picTaskinfoWidget.dart';
import 'package:taska/widgets/taskInfoWidget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: MyFireStore.getData(),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapShot) {
        if (!snapShot.hasData) {
          return Center(
            child: LottieBuilder.asset('assets/icons/loading.json'),
          );
        } else if (snapShot.hasError) {
          return const Text('error');
        } else {
          var data = snapShot.data!;
          return Padding(
            padding: PMconst.medium,
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(children: [
                  Appbar(
                    icon: Icon(
                      IconConst.bell,
                      color: ColorConst.kPrimaryColor,
                    ),
                  ),
                  MytextFormField(
                      ontap: () {
                        Navigator.pushNamed(context, '/search');
                      },
                      maxlength: 20,
                      controller: search,
                      decoration: AllStyles.textformFieldStyle(
                          hinttext: 'Search', icon: Icon(IconConst.search)),
                      validator: (v) {
                        return v;
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Projects',
                        style: TextStyle(
                            fontFamily: 'myfont',
                            fontWeight: FontWeight.bold,
                            fontSize: FontSizeconst.medium),
                      ),
                      TextButton(
                          onPressed: () async {},
                          child: const Text(
                            'See all',
                            style: TextStyle(
                                fontFamily: 'myfont',
                                fontWeight: FontWeight.bold,
                                color: ColorConst.kPrimaryColor),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.450,
                    child: data['tasks'].length != 0
                        ? Swiper(
                            autoplay: true,
                            containerHeight: size.height * 0.1,
                            itemCount: data['tasks'].length,
                            itemBuilder: (context, index) {
                              return PicTaskInfoWidget(
                                image: data['tasks'][index]['pic'],
                                index: index,
                                title: data['tasks'][index]['title'].toString(),
                                date: data['tasks'][index]['date'].toString(),
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                              'no tasks yet',
                              style: TextStyle(fontFamily: 'myfont'),
                            ),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today Task',
                        style: TextStyle(
                            fontFamily: 'myfont',
                            fontWeight: FontWeight.bold,
                            fontSize: FontSizeconst.medium),
                      ),
                      TextButton(
                          onPressed: () {
                            context.read<SeeAllProvider>().seeAllTap(context);
                          },
                          child: const Text(
                            'See all',
                            style: TextStyle(
                                fontFamily: 'myfont',
                                fontWeight: FontWeight.bold,
                                color: ColorConst.kPrimaryColor),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.6,
                    child: ListView.builder(
                      itemBuilder: (_, __) {
                        return TaskInfoWidget(
                            context: context,
                            index: __,
                            check: data['tasks'][__]['do'],
                            subtitle: data['tasks'][__]['title'],
                            title: data['tasks'][__]['date']);
                      },
                      itemCount: context.watch<SeeAllProvider>().isall
                          ? 1
                          : data['tasks'].length,
                    ),
                  )
                ]),
              ),
            ),
          );
        }
      },
    );
  }
}
