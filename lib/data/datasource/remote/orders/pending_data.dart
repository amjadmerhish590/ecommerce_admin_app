import 'package:grandadmin/core/class/crud.dart';
import 'package:grandadmin/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrders(String usersId, String ordersId) async {
    var response = await crud.postData(AppLink.approveOrders, {
      "usersid": usersId,
      "ordersid": ordersId
    });
    return response.fold((l) => l, (r) => r);
  }

}
