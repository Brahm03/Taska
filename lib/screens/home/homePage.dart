import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taska/core/components/allstyles.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/service/FirebaseService.dart';
import 'package:taska/widgets/appbar.dart';
import 'package:taska/widgets/mybutton.dart';
import 'package:taska/widgets/mytextformField.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: FirebaseService.store
          .collection('user')
          .doc(FirebaseService.auth.currentUser!.email)
          .get(),
      builder: (context, snapShot) {
        if (!snapShot.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snapShot.hasError) {
          return const Text('error');
        } else {
          var data = snapShot;
          return Padding(
            padding: PMconst.medium,
            child: SizedBox(
              child: Column(children: [
                Appbar(
                  icon: Icon(
                    IconConst.bell,
                    color: ColorConst.kPrimaryColor,
                  ),
                ),
                MytextFormField(
                    controller: search,
                    decoration: AllStyles.textformFieldStyle(
                        hinttext: 'Search', icon: Icon(IconConst.search)),
                    validator: (v){}),
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
                        onPressed: () async {
                          await FirebaseService.store
                              .collection('user')
                              .doc(FirebaseService.auth.currentUser!.email)
                              .get()
                              .then((DocumentSnapshot documentSnapshot) {
                            if (documentSnapshot.exists) {
                              debugPrint(
                                  'Document data: ${documentSnapshot.data()}');
                            } else {
                              debugPrint(
                                  'Document does not exist on the database');
                            }
                          });
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
                Container(
                  color: ColorConst.kPrimaryColor,
                  height: size.height * 0.3,
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
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(
                              fontFamily: 'myfont',
                              fontWeight: FontWeight.bold,
                              color: ColorConst.kPrimaryColor),
                        )),
                  ],
                )
              ]),
            ),
          );
        }
      },
    );
  }
}
