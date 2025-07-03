import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grandadmin/controller/categories/edit_controller.dart';
import 'package:grandadmin/core/class/handlingdataview.dart';
import 'package:grandadmin/core/constant/color.dart';
import 'package:grandadmin/core/functions/uploadfile.dart';
import 'package:grandadmin/core/functions/validinput.dart';
import 'package:grandadmin/core/shared/custombutton.dart';
import 'package:grandadmin/core/shared/customtextformglobal.dart';



class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesEditController controller = Get.put(CategoriesEditController());
    return Scaffold(
        appBar: AppBar(title: const Text("Edit Category"),),
        body: GetBuilder<CategoriesEditController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest!, widget: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextFromGlobal(hinttext: "Category Name ( English )", labeltext: "category name ( English )", iconData: Icons.category, myController: controller.name, valid: (val){
                  return validInput(val!, 1, 30, "");
                }, isNumber: false),
                CustomTextFromGlobal(hinttext: "Category Name ( Arabic )", labeltext: "category name ( Arabic )", iconData: Icons.category, myController: controller.nameAr, valid: (val){
                  return validInput(val!, 1, 30, "");
                }, isNumber: false),

                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.fourthColor,
                      onPressed: (){
                        controller.chooseImage();
                      }, child: const Text("Choose category image"),)),

                if(controller.file != null)
                  SvgPicture.file(controller.file!),


                CustomButton(text: "SAVE", onPressed: (){
                  controller.editData();
                },)

              ],
            ),
          ),)))
    );
  }

}