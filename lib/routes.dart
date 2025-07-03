import 'package:grandadmin/core/constant/routes.dart';
import 'package:grandadmin/core/middleware/mymiddleware.dart';
// import 'package:grandadmin/view/screen/address/add.dart';
// import 'package:grandadmin/view/screen/address/adddetails.dart';
// import 'package:grandadmin/view/screen/address/view.dart';
import 'package:grandadmin/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:grandadmin/view/screen/auth/login.dart';
import 'package:grandadmin/view/screen/auth/forgetpassword/resetpassword.dart';
// import 'package:grandadmin/view/screen/auth/signup.dart';
import 'package:grandadmin/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:grandadmin/view/screen/auth/success_signup.dart';
import 'package:grandadmin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:grandadmin/view/screen/auth/verifycodesignup.dart';
import 'package:grandadmin/view/screen/categories/add.dart';
import 'package:grandadmin/view/screen/categories/edit.dart';
import 'package:grandadmin/view/screen/categories/view.dart';
import 'package:grandadmin/view/screen/employee/add.dart';
import 'package:grandadmin/view/screen/employee/screen.dart';
import 'package:grandadmin/view/screen/employee/view.dart';
import 'package:grandadmin/view/screen/home.dart';
import 'package:grandadmin/view/screen/items/add.dart';
import 'package:grandadmin/view/screen/items/edit.dart';
import 'package:grandadmin/view/screen/items/view.dart';
// import 'package:grandadmin/view/screen/cart.dart';
// import 'package:grandadmin/view/screen/checkout.dart';
import 'package:grandadmin/view/screen/orders/screen.dart';
// import 'package:grandadmin/view/screen/items.dart';
import 'package:grandadmin/view/screen/language.dart';
// import 'package:grandadmin/view/screen/myfavorite.dart';
// import 'package:grandadmin/view/screen/offers.dart';
// import 'package:grandadmin/view/screen/onboarding.dart';
import 'package:grandadmin/view/screen/orders/archive.dart';
import 'package:grandadmin/view/screen/orders/details.dart';
import 'package:grandadmin/view/screen/orders/pending.dart';
// import 'package:grandadmin/view/screen/productdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // {/ this is root app }
  // language
  GetPage(name: "/", page: () => const Language(), middlewares: [
    MyMiddleWare(),
  ]),
  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  // GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.seccessResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUP()),


  //Home
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),


  //Orders
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersHome, page: () => const OrderScreen()),


  //Categories
  GetPage(name: AppRoute.categoriesView, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesAdd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesEdit, page: () => const CategoriesEdit()),

  //Items
  GetPage(name: AppRoute.itemsView, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsAdd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsEdit, page: () => const ItemsEdit()),

  //Employee
  GetPage(name: AppRoute.employeeScreen, page: () => const EmployeeScreen()),
  GetPage(name: AppRoute.employeeView, page: () => const EmployeeView()),
  GetPage(name: AppRoute.employeeAdd, page: () => const EmployeeAdd()),

];
