import 'package:grandadmin/controller/orders/screen_controller.dart';
import 'package:grandadmin/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length, ((index) {
                  return Expanded(child: CustomButtonAppBar(
                    textButton: controller.bottomAppBar[index]['title'],
                    iconData: controller.bottomAppBar[index]['icon'],
                    onPressed: () {
                      controller.changePage(index);
                    },
                    active: controller.currentPage == index ? true : false,
                  ),);
                })),
              ],
            )));
  }
}
