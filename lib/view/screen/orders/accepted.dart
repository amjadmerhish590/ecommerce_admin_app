import 'package:grandadmin/controller/orders/accepted_controller.dart';
import 'package:grandadmin/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grandadmin/view/widget/orders/orderslistcardaccepted.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return  Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersAcceptedController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => CardOrdersListAccepted(
                    listData: controller.data[index],
                  )),
            )));

  }
}
