import 'package:grandadmin/core/class/statusrequest.dart';
import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/functions/handlingdatacontroller.dart';
import 'package:grandadmin/data/datasource/remote/categories_data.dart';
import 'package:get/get.dart';
import 'package:grandadmin/data/model/categoriesmodel.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {

    data.clear();

    statusRequest = StatusRequest.loading;

    update();

    var response = await categoriesData.get();
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        List dataList = response['data'];

        data.addAll(dataList.map((e) => CategoriesModel.fromJson(e)));

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

  deleteCategory(String id, String imageName){
    categoriesData.delete({
      "id": id,
      "imageName": imageName
    });
    data.removeWhere((element) => element.categoriesId.toString() == id);
    update();
  }

  goToPageEdit(CategoriesModel categoriesModel){
    Get.toNamed(AppRoute.categoriesEdit, arguments: {
      "categoriesModel": categoriesModel
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
