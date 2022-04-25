import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/components/allstyles.dart';
import 'package:taska/core/components/allvalidators.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/provider/checkBoxprovider.dart';
import 'package:taska/provider/hidePasswordProvider.dart';
import 'package:taska/provider/signINprovider.dart';
import 'package:taska/provider/signUPprovider.dart';
import 'package:taska/widgets/connectWith.dart';
import 'package:taska/widgets/mybutton.dart';
import 'package:taska/widgets/mycheckBox.dart';
import 'package:taska/widgets/mysnackbar.dart';
import 'package:taska/widgets/mytextformField.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.050,
            right: MediaQuery.of(context).size.width * 0.050,
            top: MediaQuery.of(context).size.height * 0.150),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create your\n Account',
                style: TextStyle(
                    fontFamily: 'myfont',
                    fontSize: FontSizeconst.extralarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.050,
              ),
              Form(
                key: _key,
                child: Column(
                  children: [
                    FadeInLeftBig(
                      child: MytextFormField(
                          maxlength: 25,
                          controller: emailController,
                          decoration: AllStyles.textformFieldStyle(
                              hinttext: 'Email', icon: IconConst.email),
                          validator: Allvalidators.emailValidator),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.020,
                    ),
                    FadeInRightBig(
                      child: MytextFormField(
                          maxlength: 8,
                          obsecured:
                              context.watch<HidePasswordProvider>().ishidden,
                          controller: passwordController,
                          decoration: AllStyles.textformFieldStyle(
                              preficIcon: IconButton(
                                  onPressed: context
                                      .read<HidePasswordProvider>()
                                      .onChane,
                                  icon: IconConst.eye),
                              hinttext: 'Password',
                              icon: IconConst.lock),
                          validator: Allvalidators.passwordValidator),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.250),
                  child: Row(
                    children: [
                      MycheckBox(
                        onchanged: (v) {
                          context.read<CheckBoxprovider>().onChanged();
                        },
                        value: context.watch<CheckBoxprovider>().ckecked,
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                            fontFamily: 'myfont',
                            fontSize: FontSizeconst.small,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010,
              ),
              Mybutton(
                  width: MediaQuery.of(context).size.height * 0.8,
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      if (Provider.of<CheckBoxprovider>(context, listen: false)
                              .ckecked !=
                          false) {
                        debugPrint('entered');
                        context.read<SignUpProvider>().signUpwithEmail(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text);
                      } else {
                        Mysnackbar.showmysnack(
                            context: context,
                            text: 'click to remember me',
                            color: ColorConst.purple);
                      }
                    }
                  },
                  textcolor: ColorConst.blue,
                  buttonColor: ColorConst.kPrimaryColor,
                  text: 'Sign up'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.060,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.040,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 1,
                        color: ColorConst.darkgrey),
                    const Text(
                      'or continue with',
                      style: TextStyle(
                          fontFamily: 'myfont',
                          fontWeight: FontWeight.w300,
                          fontSize: FontSizeconst.medium),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 1,
                        color: ColorConst.darkgrey),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.030,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInDown(
                            child: ConnectWIth(
                                ontap: () {}, icon: IconConst.facebook)),
                        FadeInUp(
                          child: ConnectWIth(
                              ontap: () {
                                context
                                    .read<SignINprovider>()
                                    .signInWithGoogle();
                              },
                              icon: IconConst.google),
                        ),
                        FadeInDown(
                            child: ConnectWIth(
                                ontap: () {}, icon: IconConst.apple)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.030,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.150),
                child: Row(
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontFamily: 'myfont', color: ColorConst.darkgrey),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              fontFamily: 'myfont',
                              fontWeight: FontWeight.bold,
                              color: ColorConst.kPrimaryColor),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
