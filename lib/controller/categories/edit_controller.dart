import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:grandadmin/controller/categories/view_controller.dart';
import 'package:grandadmin/core/class/statusrequest.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/functions/handlingdatacontroller.dart';
import 'package:grandadmin/core/functions/uploadfile.dart';
import 'package:grandadmin/data/datasource/remote/categories_data.dart';
import 'package:get/get.dart';
import 'package:grandadmin/data/model/categoriesmodel.dart';


class CategoriesEditController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController nameAr;

  CategoriesModel? categoriesModel;


  StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  chooseImage() async{
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {

    if(formState.currentState!.validate()){

      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "id": categoriesModel!.categoriesId.toString(),
        "name": name.text,
        "nameAr": nameAr.text,
        "imageold": categoriesModel!.categoriesImage!,

      };

      var response = await categoriesData.edit(data, file);
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    nameAr = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    nameAr.text = categoriesModel!.categoriesNameAr!;

    super.onInit();
  }
}
