import 'dart:io';

import 'package:grandadmin/core/class/crud.dart';
import 'package:grandadmin/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  get() async {
    var response = await crud.postData(AppLink.categoriesView, {});
    return response.fold((l) => l, (r) => r);
  }
  add(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(AppLink.categoriesAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }
  edit(Map data, [File? file]) async {
    var response;
    if(file == null){
      response = await crud.postData(AppLink.categoriesEdit, data);
    }else{
      response = await crud.addRequestWithImageOne(AppLink.categoriesEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.categoriesDelete, data);
    return response.fold((l) => l, (r) => r);
  }

}
