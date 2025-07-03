import 'package:grandadmin/core/class/crud.dart';
import 'package:grandadmin/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  postData(String email, String verifycode) async {
    var response =
        await crud.postData(AppLink.verifyCodeForgetPasswordAdmin, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
