import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:grandadmin/controller/items/view_controller.dart';
import 'package:grandadmin/core/class/statusrequest.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/functions/handlingdatacontroller.dart';
import 'package:grandadmin/core/functions/uploadfile.dart';
import 'package:grandadmin/data/datasource/remote/categories_data.dart';
import 'package:grandadmin/data/model/categoriesmodel.dart';
import 'package:grandadmin/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';


class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<SelectedListItem<String>> dropDownList = [];

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController dropDownName;
  late TextEditingController dropDownId;

  late TextEditingController name;
  late TextEditingController nameAr;

  late TextEditingController desc;
  late TextEditingController descAr;

  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  TextEditingController? catName;
  TextEditingController? catId;

  StatusRequest? statusRequest = StatusRequest.none;

  File? file;



  showOptionImage(){
    showBottomMenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async{
    file = await imageUploadCamera();
    update();
  }
  chooseImageGallery() async{
    file = await fileUploadGallery(false);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("Warning", "Please Choose Image");
      }

      statusRequest = StatusRequest.loading;

      update();

      Map data = {
        "name": name.text,
        "nameAr": nameAr.text,
        "desc": desc.text,
        "descAr": descAr.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catId": catId!.text,
        "datenow": DateTime.now().toString()
      };

      var response = await itemsData.add(data, file!);
      print("+++++++++++++++++++++++++++++++++++++ Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemsView);
          ItemsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

    getCategories() async {
      CategoriesData categoriesData = CategoriesData(Get.find());

      statusRequest = StatusRequest.loading;

      update();

      var response = await categoriesData.get();
      print("+++++++++++++++++++++++++++++++++++++ Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {

          List<CategoriesModel> data = [];

          List dataList = response['data'];

          data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));

          for(int i = 0; i < data.length; i++){
            dropDownList.add(SelectedListItem(data: "${data[i].categoriesId} .${data[i].categoriesName}"));
          }

        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }






  @override
  void onInit() {
    getCategories();
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catName = TextEditingController();
    catId = TextEditingController();
    dropDownName = TextEditingController();
    dropDownId = TextEditingController();
    super.onInit();
  }
}

