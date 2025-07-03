import 'package:grandadmin/core/class/crud.dart';
import 'package:grandadmin/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPasswordAdmin, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
