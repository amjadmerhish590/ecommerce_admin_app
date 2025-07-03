import 'package:grandadmin/core/class/crud.dart';
import 'package:grandadmin/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewArchiveOrders, {});
    return response.fold((l) => l, (r) => r);
  }

}
