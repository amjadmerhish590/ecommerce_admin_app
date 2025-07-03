import 'dart:io';

import 'package:grandadmin/controller/orders/screen_controller.dart';
import 'package:grandadmin/core/constant/color.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/view/widget/orders/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(title: const Text("Orders"),),
              // drawer: Drawer(child: Text(""),),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: controller.listPage.elementAt(controller.currentPage),
            ));
  }
}
