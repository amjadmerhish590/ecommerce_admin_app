import 'package:cached_network_image/cached_network_image.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grandadmin/controller/items/add_controller.dart';
import 'package:grandadmin/controller/items/edit_controller.dart';
import 'package:grandadmin/core/class/handlingdataview.dart';
import 'package:grandadmin/core/constant/color.dart';
import 'package:grandadmin/core/functions/uploadfile.dart';
import 'package:grandadmin/core/functions/validinput.dart';
import 'package:grandadmin/core/shared/custombutton.dart';
import 'package:grandadmin/core/shared/customdropdownsearch.dart';
import 'package:grandadmin/core/shared/customtextformglobal.dart';



class ItemsEdit extends StatelessWidget {
  const ItemsEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsEditController controller = Get.put(ItemsEditController());
    return Scaffold(
        appBar: AppBar(title: const Text("Edit Item"),),
        body: GetBuilder<ItemsEditController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest!, widget: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextFromGlobal(hinttext: "Item Name ( English )", labeltext: "item name ( English )", iconData: Icons.category, myController: controller.name, valid: (val){
                  return validInput(val!, 1, 50, "");
                }, isNumber: false),
                CustomTextFromGlobal(hinttext: "Item Name ( Arabic )", labeltext: "item name ( Arabic )", iconData: Icons.category, myController: controller.nameAr, valid: (val){
                  return validInput(val!, 1, 50, "");
                }, isNumber: false),
                CustomTextFromGlobal(hinttext: "Description ( English )", labeltext: "description ( English )", iconData: Icons.category, myController: controller.desc, valid: (val){
                  return validInput(val!, 1, 200, "");
                }, isNumber: false),
                CustomTextFromGlobal(hinttext: "Description ( Arabic )", labeltext: "description ( Arabic )", iconData: Icons.category, myController: controller.descAr, valid: (val){
                  return validInput(val!, 1, 200, "");
                }, isNumber: false),
                CustomTextFromGlobal(hinttext: "Count", labeltext: "count", iconData: Icons.category, myController: controller.count, valid: (val){
                  return validInput(val!, 1, 30, "");
                }, isNumber: true),
                CustomTextFromGlobal(hinttext: "Price", labeltext: "price", iconData: Icons.category, myController: controller.price, valid: (val){
                  return validInput(val!, 1, 30, "");
                }, isNumber: true),
                CustomTextFromGlobal(hinttext: "Discount", labeltext: "discount", iconData: Icons.category, myController: controller.discount, valid: (val){
                  return validInput(val!, 1, 30, "");
                }, isNumber: true),


                CustomDropDownSearch(
                    title: "Choose Category",
                    listData: controller.dropDownList,
                    dropDownSelectedName: controller.catName!,
                    dropDownSelectedId: controller.catId!),

                const SizedBox(height: 10,),
                RadioListTile(
                    title: Text("hide"),
                    value: "0", groupValue: controller.active, onChanged: (val){
                      controller.changeStatusActive(val);
                }),
                RadioListTile(
                    title: Text("active"),
                    value: "1", groupValue: controller.active, onChanged: (val){
                  controller.changeStatusActive(val);
                }),

                const SizedBox(height: 10,),


                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      onPressed: (){
                        controller.showOptionImage();
                      }, child: const Text("Choose Item image"),)),



                if(controller.file != null)
                  Image.file(controller.file!, width: 100, height: 100,),


                CustomButton(text: "Save", onPressed: (){
                  controller.editData();
                },)

              ],
            ),
          ),)))
    );
  }

}