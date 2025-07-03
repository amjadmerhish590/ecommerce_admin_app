import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grandadmin/controller/employee/view_controller.dart';
import 'package:grandadmin/core/class/handlingdataview.dart';



class EmployeeView extends StatelessWidget {
  const EmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeController());
    return Scaffold(

        body: GetBuilder<EmployeeController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: WillPopScope(
          onWillPop: (){
            return controller.myBack();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return  Card(child: Row(
                    children: [
                      Column(
                        children: [
                          Text("Email: ${controller.data[index].deliveryEmail!}", style: TextStyle(fontWeight: FontWeight.bold),),

                          Text("Phone: ${controller.data[index].deliveryPhone.toString()}", style: TextStyle(fontWeight: FontWeight.bold),),

                          Text("Name: ${controller.data[index].deliveryName!}", style: TextStyle(fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Expanded(
                          flex: 3,
                          child: ListTile(title: Text("ID: ${controller.data[index].deliveryId.toString()}"),
                              subtitle: Text("${controller.data[index].deliveryCreate!}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(onPressed: (){
                                    Get.defaultDialog(title: "Warning", middleText: "Are you sure about the deletion process?", onCancel: (){}, onConfirm: (){
                                      controller.deleteEmployee(controller.data[index].deliveryId.toString());
                                      Get.back();
                                    });
                                  } , icon: const Icon(Icons.person_remove_sharp)),

                                ],
                              )
                          )),

                    ],
                  ));

              },
            ),
          ),
        ),))
    );
  } }