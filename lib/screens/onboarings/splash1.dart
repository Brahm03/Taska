import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';
import 'package:taska/provider/infoChangerProvider.dart';
import 'package:taska/widgets/mybutton.dart';

class SplashOne extends StatelessWidget {
  const SplashOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allVariables = context.watch<infoChangerProvider>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: allVariables.icons[allVariables.index]),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                allVariables.textInfo[allVariables.index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: FontSizeconst.large,
                    fontFamily: 'myfont',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(allVariables.lorem)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.250),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.050,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, __) {
                        return Padding(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 0.010),
                            child: Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  radius: RadiusConst.tiny,
                                  backgroundColor: __ == allVariables.index
                                      ? ColorConst.kPrimaryColor
                                      : ColorConst.blue,
                                )));
                      },
                      itemCount: allVariables.textInfo.length - 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Mybutton(
                        width: MediaQuery.of(context).size.width * 0.8,
                        onPressed: () {
                          context.read<infoChangerProvider>().onTap(context);
                        },
                        textcolor: ColorConst.blue,
                        buttonColor: ColorConst.kPrimaryColor,
                        text: 'next'),
                    Mybutton(
                        width: MediaQuery.of(context).size.width * 0.8,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/signup', (route) => false);
                        },
                        textcolor: ColorConst.kPrimaryColor,
                        buttonColor: ColorConst.blue,
                        text: 'skip'),
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
