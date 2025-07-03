import 'package:grandadmin/core/class/crud.dart';
import 'package:grandadmin/linkapi.dart';

class VerifycodeSignUpData {
  Crud crud;
  VerifycodeSignUpData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUpAdmin, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  reSendData(String email) async {
    var response = await crud.postData(AppLink.reSendAdmin, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
