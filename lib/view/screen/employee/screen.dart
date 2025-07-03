import 'dart:io';

import 'package:grandadmin/controller/employee/screen_controller.dart';
import 'package:grandadmin/controller/orders/screen_controller.dart';
import 'package:grandadmin/core/constant/color.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/view/widget/employee/custombottomappbaremployee.dart';
import 'package:grandadmin/view/widget/orders/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeScreenControllerImp());
    return GetBuilder<EmployeeScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(title: const Text("Employee"),),
          // drawer: Drawer(child: Text(""),),
          bottomNavigationBar: const CustomBottomAppBarEmployee(),
          body: controller.listPage.elementAt(controller.currentPage),
        ));
  }
}
