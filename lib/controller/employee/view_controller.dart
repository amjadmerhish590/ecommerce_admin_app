import 'package:grandadmin/core/class/statusrequest.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/functions/handlingdatacontroller.dart';
import 'package:get/get.dart';
import 'package:grandadmin/data/datasource/remote/employee_data.dart';
import 'package:grandadmin/data/model/employeemodel.dart';

class EmployeeController extends GetxController {
  EmployeeData employeeData = EmployeeData(Get.find());

  List<EmployeeModel> data = [];

  late StatusRequest statusRequest;

  getData() async {

    data.clear();

    statusRequest = StatusRequest.loading;

    update();

    var response = await employeeData.getData();
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        List dataList = response['data'];

        data.addAll(dataList.map((e) => EmployeeModel.fromJson(e)));

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  myBack(){
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }
  //
  deleteEmployee(String id){
    employeeData.delete(id);
    data.removeWhere((element) => element.deliveryId.toString() == id);
    update();
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
