import 'package:grandadmin/core/class/statusrequest.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/functions/handlingdatacontroller.dart';
import 'package:grandadmin/data/datasource/remote/items_data.dart';
import 'package:get/get.dart';
import 'package:grandadmin/data/model/itemsmodel.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {

    data.clear();

    statusRequest = StatusRequest.loading;

    update();

    var response = await itemsData.get();
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        List dataList = response['data'];

        data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));

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

  deleteItem(String id, String imageName){
    itemsData.delete({
      "id": id,
      "imageName": imageName
    });
    data.removeWhere((element) => element.itemsId.toString() == id);
    update();
  }

  goToPageEdit(ItemsModel itemsModel){
    Get.toNamed(AppRoute.itemsEdit, arguments: {
      "itemsModel": itemsModel
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
