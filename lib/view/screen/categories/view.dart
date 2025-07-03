import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grandadmin/controller/categories/view_controller.dart';
import 'package:grandadmin/core/class/handlingdataview.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/linkapi.dart';



class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.categoriesAdd);
      }, child: const Icon(Icons.add),),
      body: GetBuilder<CategoriesController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: WillPopScope(
        onWillPop: (){
          return controller.myBack();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        controller.goToPageEdit(controller.data[index]);
                      },
                      child: Card(child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                child: SvgPicture.network(
                                    height: 80,
                                    "${AppLink.imageCategories}/${controller.data[index].categoriesImage}"),
                              )),
                          Expanded(
                              flex: 3,
                              child: ListTile(title: Text(controller.data[index].categoriesName!),
                                subtitle: Text(controller.data[index].categoriesDatetime!),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(onPressed: (){
                                      Get.defaultDialog(title: "Warning", middleText: "Are you sure about the deletion process?", onCancel: (){}, onConfirm: (){
                                        controller.deleteCategory(controller.data[index].categoriesId.toString(), controller.data[index].categoriesImage!);
                                        Get.back();
                                      });
                                    } , icon: const Icon(Icons.delete_outline)),

                                  ],
                                )
                              )),

                        ],
                      )),
                    );
              },
          ),
        ),
      ),))
    );
  } }