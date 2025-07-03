// import 'package:grandadmin/view/screen/notification.dart';
// import 'package:grandadmin/view/screen/offers.dart';
// import 'package:grandadmin/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grandadmin/view/screen/orders/accepted.dart';
import 'package:grandadmin/view/screen/orders/archive.dart';
import 'package:grandadmin/view/screen/orders/pending.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int i);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentPage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView()

  ];

  List bottomAppBar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_shopping_cart_outlined},
    {"title": "Archive", "icon": Icons.archive_outlined},


  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
