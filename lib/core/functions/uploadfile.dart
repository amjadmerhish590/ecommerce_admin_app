import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grandadmin/core/constant/color.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async{
  final XFile? file = await ImagePicker().pickImage(source: ImageSource.camera , imageQuality: 90);
  if(file != null){
    return File(file.path);
  }else {
    return null;
  }
}
fileUploadGallery([isSvg = false]) async{

  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg ? [
      "svg" ,
      "SVG"
    ] :[
      "PNG" ,
      "png" ,
      "jpg" ,
      "JPG" ,
      "jpeg" ,
      "JPEG" ,
      "gif" ,
      "GIF"
    ]
  );

  if(result != null){
    return File(result.files.single.path!);
  }else {
    return null;
  }
}

showBottomMenu(imageUploadCamera(), fileUploadGallery()){
  Get.bottomSheet(
    Directionality(textDirection: TextDirection.rtl,
        child:Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: const Text("Choose Image",
                  style: TextStyle(fontSize: 22,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold
                  ),),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              ListTile(
                onTap: (){
                  imageUploadCamera();
                  Get.back();
                },
                leading: const Icon(Icons.camera_alt, size: 40,),
                title:  const Text("Image from camera", style: TextStyle(fontSize: 20),),
              ),
              ListTile(
                onTap: (){
                  fileUploadGallery();
                  Get.back();
                },
                leading: const Icon(Icons.image, size: 40,),
                title:  const Text("Image from gallery", style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        )
    ),
    backgroundColor: Colors.white
  );
}