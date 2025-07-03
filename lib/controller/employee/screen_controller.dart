import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grandadmin/view/screen/employee/add.dart';
import 'package:grandadmin/view/screen/employee/view.dart';


abstract class EmployeeScreenController extends GetxController {
  changePage(int i);
}

class EmployeeScreenControllerImp extends EmployeeScreenController {
  int currentPage = 0;

  List<Widget> listPage = [
    const EmployeeView(),
    const EmployeeAdd(),
    // const OrdersArchiveView()
  ];

  List bottomAppBar = [
    {"title": "View", "icon": Icons.person},
    {"title": "Add", "icon": Icons.person_add_alt_1},
    // {"title": "Archive", "icon": Icons.archive_outlined},


  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
