import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:grandadmin/controller/categories/view_controller.dart';
import 'package:grandadmin/core/class/statusrequest.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/functions/handlingdatacontroller.dart';
import 'package:grandadmin/core/functions/uploadfile.dart';
import 'package:grandadmin/data/datasource/remote/categories_data.dart';
import 'package:get/get.dart';
import 'package:grandadmin/data/datasource/remote/employee_data.dart';


class EmployeeAddController extends GetxController {
  EmployeeData employeeData = EmployeeData(Get.find());


  GlobalKey<FormState> formState = GlobalKey<FormState>();


  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;


  StatusRequest? statusRequest = StatusRequest.none;

  addData() async {

    if(formState.currentState!.validate()){


      statusRequest = StatusRequest.loading;

      update();

      var response = await employeeData.addData(
          username.text, password.text, email.text, phone.text
      );
      print("+++++++++++++++++++++++++++++++++++++ Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.homepage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
