import 'package:grandadmin/controller/auth/login_controller.dart';
import 'package:grandadmin/core/class/handlingdataview.dart';
import 'package:grandadmin/core/constant/color.dart';
import 'package:grandadmin/core/functions/alertexitapp.dart';
import 'package:grandadmin/core/functions/validinput.dart';
import 'package:grandadmin/view/widget/auth/custombuttonauth.dart';
import 'package:grandadmin/view/widget/auth/customtextbodyauth.dart';
import 'package:grandadmin/view/widget/auth/customtextformauth.dart';
import 'package:grandadmin/view/widget/auth/customtexttitleauth.dart';
import 'package:grandadmin/view/widget/auth/logoauth.dart';
import 'package:grandadmin/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Sign In (Admin)",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              const LogoAuth(),
                              const CustomTextTitleAuth(
                                text: "Welcome Back",
                              ),
                              const SizedBox(height: 10),
                              const CustomTextBodyAuth(
                                text:
                                    "Sign In With Your Email And Password OR Continue With Social Media",
                              ),
                              const SizedBox(height: 20),
                              CustomTextFromAuth(
                                hinttext: "Enter Your Email",
                                iconData: Icons.email_outlined,
                                labeltext: "Email",
                                myController: controller.email,
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "email");
                                },
                              ),
                              GetBuilder<LoginControllerImp>(
                                  builder: (controller) => CustomTextFromAuth(
                                        hinttext: "Enter Your Password",
                                        iconData: Icons.lock_outlined,
                                        labeltext: "Password",
                                        myController: controller.password,
                                        isNumber: false,
                                        valid: (val) {
                                          return validInput(
                                              val!, 3, 30, "password");
                                        },
                                        obscureText: controller.isShowPassword,
                                        onTapIcon: () {
                                          controller.showPassword();
                                        },
                                      )),
                              CustomButtonAuth(
                                  text: "Sign In",
                                  onPressed: () {
                                    controller.login();
                                  }),
                              const SizedBox(height: 30),

                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
