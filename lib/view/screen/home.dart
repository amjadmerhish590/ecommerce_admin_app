import 'package:cached_network_image/cached_network_image.dart';
import 'package:grandadmin/controller/home_controller.dart';
import 'package:grandadmin/core/class/handlingdataview.dart';
import 'package:grandadmin/core/constant/imageasset.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:grandadmin/data/model/itemsmodel.dart';
import 'package:grandadmin/linkapi.dart';
// import 'package:grandadmin/view/widget/customappbar.dart';
// import 'package:grandadmin/view/widget/home/customcardhome.dart';
// import 'package:grandadmin/view/widget/home/customtitlehome.dart';
// import 'package:grandadmin/view/widget/home/listcategorieshome.dart';
// import 'package:grandadmin/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grandadmin/view/widget/home/cardadmin.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeContrllerImp controller = Get.put(HomeContrllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), leading: IconButton(onPressed: (){
        Get.defaultDialog(title: "Warning", middleText: "Are you sure you're logout?", onCancel: (){}, onConfirm: (){
          controller.logout();
          Get.back();
        });
      }, icon: Icon(Icons.exit_to_app))),
      body: ListView(
        children: [

          // ScreenTypeLayout(
          //   mobile: Container(color:Colors.blue, height: 50,),
          //   tablet: Container(color: Colors.yellow, height: 50,),
          // ),
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: getValueForScreenType<int>(
              context: context,
              mobile: 3,
              tablet: 4,
              desktop: 5,
            ),
              mainAxisExtent: 150
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              // if(controller.myServices.sharedPreferences.getString("step")! == '2')
              CardAdminHome(url: AppImageAsset.categories,title: "Categories",onClick: (){
                Get.toNamed(AppRoute.categoriesView);
              },),
                CardAdminHome(url: AppImageAsset.product,title: "Items",onClick: (){
                Get.toNamed(AppRoute.itemsView);
              },),
              CardAdminHome(url: AppImageAsset.users,title: "Users",onClick: (){},),
              CardAdminHome(url: AppImageAsset.employee,title: "Empolyee",onClick: (){
                Get.toNamed(AppRoute.employeeScreen);
              },),
              CardAdminHome(url: AppImageAsset.notification,title: "Notification",onClick: (){},),
              CardAdminHome(url: AppImageAsset.order,title: "Orders & Report",onClick: (){
                Get.toNamed(AppRoute.ordersHome);
              },),
              // CardAdminHome(url: AppImageAsset.report,title: "Report",onClick: (){},),



          ],)
        ],
      ),
    );
  }
}


