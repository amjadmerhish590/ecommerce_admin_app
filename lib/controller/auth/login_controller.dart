import 'package:grandadmin/core/class/statusrequest.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/functions/handlingdatacontroller.dart';
import 'package:grandadmin/core/services/services.dart';
import 'package:grandadmin/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  // goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  List data = [];

  String? accessToken;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("+++++++++++++++++++++++++++++++++++++ Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          if (response['data']['admin_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", response['data']['admin_id'].toString());
            String adminId = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['admin_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['admin_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['admin_phone'].toString());
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic('admin');
            FirebaseMessaging.instance
                .subscribeToTopic('admin${adminId}');

            Get.offAllNamed(AppRoute.homepage);
          } else {
            Get.toNamed(AppRoute.verifyCodeSignUp, arguments: {
              "email": email.text,
            });
          }
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  // goToSignUp() {
  //   Get.offNamed(AppRoute.signUp); // for problem GlobalKey
  // }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }



  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
