
import 'package:flutter/material.dart';
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
import 'package:taska/widgets/mybutton.dart';
import 'package:taska/widgets/mytextformField.dart';
import 'package:taska/widgets/timePickers.dart';

class AddNewProjectWidget extends StatelessWidget {
  const AddNewProjectWidget({
    required this.size,
    required GlobalKey<FormState> key1,
    required this.titleController,
    required this.dateController,
    required this.description,
    required this.timeController,
  }) : _key = key1;

  final Size size;
  final GlobalKey<FormState> _key;
  final TextEditingController titleController;
  final TextEditingController dateController;
  final TextEditingController description;
  final TextEditingController timeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.6,
      padding: PMconst.small,
      margin: PMconst.medium,
      decoration: BoxDecoration(
          color: ColorConst.grey,
          borderRadius:
              BorderRadius.circular(RadiusConst.medium)),
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
            // SizedBox(
            //   height: size.height * 0.040,
            // ),
            Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Upload photo for Project', style: TextStyle(fontSize: FontSizeconst.medium,fontFamily: 'myfont', color: ColorConst.kPrimaryColor),),IconButton(
                          splashRadius: 1,
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (widget) => Center(
                                      child: LottieBuilder.asset(
                                          'assets/icons/loading.json'),
                                    ));
                            await context
                                .read<MyImageprovider>()
                                .pickImage();
                            context
                                .read<UserInfoProvider>()
                                .addIMGtoDB(
                                    image: Provider.of<MyImageprovider>(context,listen: false).image!,
                                    foldername: 'taskImages');
                            Navigator.pop(context);
                          },
                          icon: IconConst.uploadImage),
                       ] ),
                    MytextFormField(
                        maxlength: 20,
                        controller: titleController,
                        decoration: AllStyles.textformFieldStyle(
                            hinttext: 'Title of you task',
                            icon: const SizedBox()),
                        validator: (v) {}),
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    Row(children: [
                      SizedBox(
                        width: size.width * 0.7,
                        child: MytextFormField(
                            maxlength: 15,
                            enabled: false,
                            controller: dateController,
                            decoration:
                                AllStyles.textformFieldStyle(
                              icon: const SizedBox(),
                              preficIcon: const SizedBox(),
                              hinttext: 'Date time',
                            ),
                            validator: (v) {}),
                      ),
                      IconButton(
                          onPressed: () async {
                            final DateTime? time =
                                await TimePickers.datetimer(
                                    context);
                            time != null
                                ? time.day != DateTime.now().day
                                    ? dateController.text =
                                        '${time.day} / ${time.month} / ${time.year}'
                                    : dateController.text = ''
                                : 'Today';
                          },
                          icon: Icon(IconConst.calendar))
                    ]),
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    MytextFormField(
                        maxlength: 25,
                        controller: description,
                        decoration: AllStyles.textformFieldStyle(
                            hinttext: 'Description',
                            icon: const SizedBox()),
                        validator: (v) {}),
                    Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width * 0.7,
                            child: MytextFormField(
                                maxlength: 8,
                                enabled: false,
                                controller: timeController,
                                decoration:
                                    AllStyles.textformFieldStyle(
                                        preficIcon:
                                            const SizedBox(),
                                        hinttext: 'Pick time',
                                        icon: const SizedBox()),
                                validator: (v) {}),
                          ),
                          IconButton(
                              onPressed: () async {
                                TimeOfDay? selectedTime =
                                    await TimePickers.time(
                                        context);
                                selectedTime != null
                                    ? timeController.text =
                                        '${selectedTime.hour} : ${selectedTime.minute}'
                                            .toUpperCase()
                                    : timeController.text = '';
                                debugPrint(
                                    '${selectedTime!.hour} : ${selectedTime.minute}');
                              },
                              icon: Icon(IconConst.bell))
                        ]),
                  ],
                )),
            SizedBox(
              height: size.height * 0.050,
            ),
            Mybutton(
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    showDialog(
                        useSafeArea: true,
                        context: context,
                        builder: (widget) => SizedBox(
                              height: size.height * 0.1,
                              width: size.height * 0.1,
                              child: Center(
                                  child: SizedBox(
                                height: size.height * 0.2,
                                child: LottieBuilder.asset(
                                  'assets/icons/load.json',
                                  fit: BoxFit.cover,
                                ),
                              )),
                            ));
                    await context
                        .read<UserInfoProvider>()
                        .refresh();
                    context.read<UserInfoProvider>().addTaskToDB(
                        context: context,
                        title: titleController.text,
                        date: dateController.text,
                        description: description.text);
                        
                  }
                },
                textcolor: ColorConst.blue,
                buttonColor: ColorConst.kPrimaryColor,
                text: 'Add New Task')
          ],
        ),
      ),
    );
  }
}
