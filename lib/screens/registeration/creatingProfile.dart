import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:phonenumbers/phonenumbers.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/components/allstyles.dart';
import 'package:taska/core/components/allvalidators.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';
import 'package:taska/provider/editProfileImage.dart';
import 'package:taska/provider/writeUserInfoProvider.dart';
import 'package:taska/service/FirebaseService.dart';
import 'package:taska/widgets/mybutton.dart';
import 'package:taska/widgets/mysnackbar.dart';
import 'package:taska/widgets/mytextformField.dart';

class CreatingProfilePage extends StatelessWidget {
  CreatingProfilePage({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  PhoneNumberEditingController phonenumberController =
      PhoneNumberEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: PMconst.medium,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fill your profile',
                    style: TextStyle(
                        fontFamily: 'myfont',
                        fontWeight: FontWeight.bold,
                        fontSize: FontSizeconst.large),
                  ),
                  SizedBox(
                    height: size.height * 0.070,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: RadiusConst.extralarge + 20,
                                backgroundColor: ColorConst.darkgrey,
                                child: Center(
                                    child: context
                                                .watch<MyImageprovider>()
                                                .image ==
                                            null
                                        ? Padding(
                                            padding: PMconst.medium,
                                            child: LottieBuilder.asset(
                                              'assets/icons/profile.json',
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : ClipOval(
                                            clipBehavior: Clip.hardEdge,
                                            child: Image.file(
                                              File(context
                                                  .watch<MyImageprovider>()
                                                  .image!
                                                  .path),
                                              fit: BoxFit.fitHeight,
                                            ))),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left:
                                      MediaQuery.of(context).size.width * 0.20,
                                  child: IconButton(
                                    icon: IconConst.add,
                                    onPressed: () async {
                                      await context
                                          .read<MyImageprovider>()
                                          .pickImage();
                                      context
                                          .read<UserInfoProvider>()
                                          .addIMGtoDB(
                                              image:
                                                  Provider.of<MyImageprovider>(
                                                          context,
                                                          listen: false
                                                          )
                                                      .image!);
                                    },
                                  ))
                            ],
                          ),
                          Padding(
                            padding: PMconst.large,
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.380,
                              child: Form(
                                key: _key,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MytextFormField(
                                        maxlength: 20,
                                        controller: fullnameController,
                                        decoration:
                                            AllStyles.textformFieldStyle(
                                                hinttext: 'Full name',
                                                icon: const SizedBox()),
                                        validator: Allvalidators.nameValidator),
                                    MytextFormField(
                                        maxlength: 20,
                                        controller: usernameController,
                                        decoration:
                                            AllStyles.textformFieldStyle(
                                                hinttext: 'Username',
                                                icon: const SizedBox()),
                                        validator: Allvalidators.nameValidator),
                                    MytextFormField(
                                      controller: birthController,
                                      decoration: AllStyles.textformFieldStyle(
                                          hinttext: 'Date of Birth',
                                          icon: const SizedBox(),
                                          preficIcon: IconButton(
                                            icon: Icon(IconConst.calendar),
                                            onPressed: () async {
                                              final DateTime? time =
                                                  await showDatePicker(
                                                      initialEntryMode:
                                                          DatePickerEntryMode
                                                              .calendar,
                                                      initialDatePickerMode:
                                                          DatePickerMode.year,
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate:
                                                          DateTime.utc(1999),
                                                      lastDate:
                                                          DateTime.utc(2030));
                                              birthController.text =
                                                  '${time!.day} / ${time.month} / ${time.year}';
                                            },
                                          )),
                                      validator: Allvalidators.dateOfbirth,
                                    ),
                                    MytextFormField(
                                        maxlength: 30,
                                        controller: emailController,
                                        decoration:
                                            AllStyles.textformFieldStyle(
                                                hinttext: 'Email',
                                                icon: const SizedBox(),
                                                preficIcon: IconConst.email),
                                        validator:
                                            Allvalidators.secondEmailValidator),
                                    PhoneNumberFormField(
                                      style:
                                          const TextStyle(fontFamily: 'myfont'),
                                      errorMessage: 'wrong number',
                                      countryCodeWidth:
                                          MediaQuery.of(context).size.width *
                                              0.150,
                                      controller: phonenumberController,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Mybutton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  context.read<UserInfoProvider>().writeToDb(
                                      context: context,
                                      email: emailController.text,
                                      fullname: fullnameController.text,
                                      birth: birthController.text,
                                      username: usernameController.text);
                                } else {
                                  Mysnackbar.showmysnack(
                                      context: context,
                                      text: 'check all fields',
                                      color: ColorConst.purple);
                                }
                              },
                              textcolor: ColorConst.blue,
                              buttonColor: ColorConst.kPrimaryColor,
                              text: 'Continue')
                        ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
