import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Note",
      middleText: "Are you sure for exit application",
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text("Confirm"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel"),
        )
      ]);
  return Future.value(true);
}
