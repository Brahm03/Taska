import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/components/allstyles.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/provider/writeUserInfoProvider.dart';
import 'package:taska/widgets/mytextformField.dart';
import 'package:taska/widgets/taskInfoWidget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = context.watch<UserInfoProvider>().temp;
    debugPrint(data.toString());
    return Scaffold(
      body: Padding(
        padding: PMconst.medium,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: MytextFormField(
                  maxlength: 20,
                  search: (v) {
                    context.read<UserInfoProvider>().search(v);
                  },
                  controller: search,
                  decoration: AllStyles.textformFieldStyle(
                      hinttext: 'Search', icon: Icon(IconConst.search)),
                  validator: (v) {
                    return v;
                  }),
            ),
            Expanded(
              flex: 9,
              child: data.isNotEmpty ? ListView.builder(
                itemBuilder: (_, __) {
                  return TaskInfoWidget(
                      context: context,
                      index: __,
                      check: data.toList()[__]['do'],
                      subtitle: data.toList()[__]['title'],
                      title: data.toList()[__]['date']);
                },
                itemCount: context.watch<UserInfoProvider>().temp.length,
              ) : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.asset('assets/icons/search.json'),
                  const Text('nothing found yet', style: TextStyle(fontFamily: 'myfont', color: ColorConst.kPrimaryColor, fontSize: FontSizeconst.medium),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
