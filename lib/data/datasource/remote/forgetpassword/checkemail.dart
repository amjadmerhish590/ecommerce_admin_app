import 'package:grandadmin/core/class/crud.dart';
import 'package:grandadmin/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmailAdmin, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
