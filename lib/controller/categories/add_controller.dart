import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:grandadmin/controller/categories/view_controller.dart';
import 'package:grandadmin/core/class/statusrequest.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/functions/handlingdatacontroller.dart';
import 'package:grandadmin/core/functions/uploadfile.dart';
import 'package:grandadmin/data/datasource/remote/categories_data.dart';
import 'package:get/get.dart';


class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController nameAr;


  StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  chooseImage() async{
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {

    if(formState.currentState!.validate()){
      if(file == null){
        Get.snackbar("Warning", "Please Choose Image SVG");
      }

      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "name": name.text,
        "nameAr": nameAr.text,
      };

      var response = await categoriesData.add(data, file!);
      print("+++++++++++++++++++++++++++++++++++++ Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.categoriesView);
          CategoriesController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    nameAr = TextEditingController();
    super.onInit();
  }
}
