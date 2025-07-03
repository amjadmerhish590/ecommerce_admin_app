import 'package:grandadmin/core/class/crud.dart';
import 'package:grandadmin/linkapi.dart';

class EmployeeData {
  Crud crud;
  EmployeeData(this.crud);

  addData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.employeeAdd, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  getData() async {
    var response = await crud.postData(AppLink.employeeView, {});
    return response.fold((l) => l, (r) => r);
  }

  delete(String deliveryID) async {
    var response = await crud.postData(AppLink.employeeDelete, {
      "id": deliveryID,
    });
    return response.fold((l) => l, (r) => r);
  }

}
