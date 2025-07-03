import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grandadmin/controller/categories/add_controller.dart';
import 'package:grandadmin/controller/employee/add_controller.dart';
import 'package:grandadmin/core/class/handlingdataview.dart';
import 'package:grandadmin/core/constant/color.dart';
import 'package:grandadmin/core/functions/uploadfile.dart';
import 'package:grandadmin/core/functions/validinput.dart';
import 'package:grandadmin/core/shared/custombutton.dart';
import 'package:grandadmin/core/shared/customtextformglobal.dart';



class EmployeeAdd extends StatelessWidget {
  const EmployeeAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmployeeAddController controller = Get.put(EmployeeAddController());
    return Scaffold(
        body: GetBuilder<EmployeeAddController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest!, widget: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextFromGlobal(hinttext: "Username", labeltext: "username", iconData: Icons.supervised_user_circle_outlined, myController: controller.username, valid: (val){
                  return validInput(val!, 1, 30, "");
                }, isNumber: false),
                CustomTextFromGlobal(hinttext: "Password", labeltext: "password", iconData: Icons.password, myController: controller.password, valid: (val){
                  return validInput(val!, 7, 30, "");
                }, isNumber: false),
                CustomTextFromGlobal(hinttext: "Email", labeltext: "email", iconData: Icons.email, myController: controller.email, valid: (val){
                  return validInput(val!, 1, 30, "");
                }, isNumber: false),
                CustomTextFromGlobal(hinttext: "Phone", labeltext: "phone", iconData: Icons.phone, myController: controller.phone, valid: (val){
                  return validInput(val!, 1, 30, "");
                }, isNumber: true),

                CustomButton(text: "ADD Employee", onPressed: (){
                  controller.addData();
                },)

              ],
            ),
          ),)))
    );
  }

}