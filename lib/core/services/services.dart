import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
                apiKey: "AIzaSyBj-cpsmJF5mrcV-ZTgXVjcbicRzqP79O0",
                appId: "1:377554823881:android:e29e89a28cfa65201abb18",
                messagingSenderId: "377554823881",
                projectId: "bmwamjad-56228"),
          )
        : await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
