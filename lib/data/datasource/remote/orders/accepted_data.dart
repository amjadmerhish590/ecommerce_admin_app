import 'package:grandadmin/core/class/crud.dart';
import 'package:grandadmin/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewAcceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(String ordersId, String usersId, String ordersType) async {
    var response = await crud.postData(AppLink.prepare, {
      "ordersid": ordersId,
      "usersid": usersId,
      "ordertype": ordersType,
    });
    return response.fold((l) => l, (r) => r);
  }
  
}
