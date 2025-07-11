import 'package:grandadmin/core/class/statusrequest.dart';
import 'package:grandadmin/core/functions/handlingdatacontroller.dart';
import 'package:grandadmin/core/services/services.dart';
import 'package:grandadmin/data/datasource/remote/orders/accepted_data.dart';
import 'package:grandadmin/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersAcceptedController extends GetxController {
  OrdersAcceptedData ordersAcceptedData = OrdersAcceptedData(Get.find());
  List<OrdersModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order Is Being Prepared";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery Man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersAcceptedData.getData();
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  doneprepare(String ordersId, String usersId, String ordersType) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersAcceptedData
        .donePrepare(ordersId, usersId, ordersType);
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
