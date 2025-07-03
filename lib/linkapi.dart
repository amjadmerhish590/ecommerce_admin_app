class AppLink {
  static const String server = "https://mft-ltd.com/ecommerce_amjad/admin";

  // +++++++++++++++++++++++ Image++++++++++++++++++++++++
  static const String imageStatic =
      "https://mft-ltd.com/ecommerce_amjad/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageitems = "$imageStatic/items";
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++

  //
  static const String test = "$server/test.php";

  // +++++++++++++++++++++++ Notification ++++++++++++++++++++++++
  static const String notification = "$server/notification.php";



  // +++++++++++++++++++++++ Home ++++++++++++++++++++++++
  static const String homepage = "$server/home.php";

  // +++++++++++++++++++++++ Items ++++++++++++++++++++++++
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";


  // +++++++++++++++++++++++ Orders ++++++++++++++++++++++

  static const String approveOrders = "$server/orders/approve.php";
  static const String prepare = "$server/orders/prepare.php";

  static const String viewArchiveOrders = "$server/orders/archive.php";
  static const String viewPendingOrders = "$server/orders/viewpending.php";
  static const String viewAcceptedOrders = "$server/orders/viewaccepted.php";
  static const String detailsOrders = "$server/orders/details.php";




  // +++++++++++++++++++++++ Auth Admin++++++++++++++++++++++++
  static const String signUpAdmin = "$server/auth/signup.php";
  static const String loginAdmin = "$server/auth/login.php";
  static const String verifyCodeSignUpAdmin =
      "$server/auth/verifycode.php";
  static const String reSendAdmin = "$server/auth/resend.php";

  // +++++++++++++++++++++++ ForgetPassword Admin++++++++++++++++++++++++

  static const String checkEmailAdmin =
      "$server/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPasswordAdmin =
      "$server/forgetpassword/verifycode.php";
  static const String resetPasswordAdmin =
      "$server/forgetpassword/resetpassword.php";

  // +++++++++++++++++++++++ Categories ++++++++++++++++++++++++
  static const String categoriesView = "$server/categories/view.php";
  static const String categoriesAdd = "$server/categories/add.php";
  static const String categoriesEdit = "$server/categories/edit.php";
  static const String categoriesDelete = "$server/categories/delete.php";

  // +++++++++++++++++++++++ Items ++++++++++++++++++++++++
  static const String itemsView = "$server/items/view.php";
  static const String itemsAdd = "$server/items/add.php";
  static const String itemsEdit = "$server/items/edit.php";
  static const String itemsDelete = "$server/items/delete.php";

  // +++++++++++++++++++++++ Employee ++++++++++++++++++++++++
  static const String employeeView = "$server/employee/view.php";
  static const String employeeAdd = "$server/employee/add.php";
  static const String employeeDelete = "$server/employee/delete.php";



}

