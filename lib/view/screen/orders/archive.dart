import 'package:grandadmin/controller/orders/archive_controller.dart';
import 'package:grandadmin/core/class/handlingdataview.dart';
import 'package:grandadmin/view/widget/orders/orderslistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return  Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) => CardOrdersListArchive(
                              listData: controller.data[index],
                            )),
                  )));
  }
}
