import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/services/services.dart';


class HomeContrllerImp extends GetxController {

  MyServices myServices = Get.find();

  logout() {
    String adminId = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic('admin');
    FirebaseMessaging.instance.unsubscribeFromTopic('admin${adminId}');
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

}


