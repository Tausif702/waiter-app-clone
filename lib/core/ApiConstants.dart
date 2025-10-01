class ApiConstants {
  static const String baseUrl = "http://157.175.126.219:3000/api/v1/";

  // end points
  static const String login = "waiter/auth/login";
  static const String logout = "waiter/auth/logout";
  static const String RESET_PASSWORD = "waiter/auth/forget-password";
  static const String verifOtp = "waiter/auth/verify-otp";
  static const String setNewPassword = "waiter/auth/set-new-password";
  static const String Resend = "waiter/auth/resend";
  static const String changePassword = "waiter/auth/change-password";
  static const String profileFetch = "waiter/auth/profile-fetch";
  static const String manualOrder = "waiter/manual-order/category-list";
  static const String tableList = "waiter/manual-order/table-list";
  static const String manualOrderItemList = "waiter/manual-order/item-list";
  static const String placeOrder = "waiter/manual-order/item/place-order";
  static const String placeOrderBillingDetails = "waiter/manual-order/item/fetch-billing";
  static const String ADD_TOCART = "waiter/manual-order/item/add-to-cart";
  static const String getCartMenu = "waiter/manual-order/item/get-cart-menu";
  static const String getCart = "waiter/manual-order/item/get-cart";
  static const String pendingAndCancelListHome = "waiter/manual-order/fetch-by-table";
  static const String oneOrderCancel = "waiter/manual-order/cancel-one-order";
  static const String oneOrderServed = "waiter/manual-order/served-one-item";
  static const String cancelAllOrder = "waiter/manual-order/cancel-all-oder";

  static const String getAllTables = "waiter/order/get-all-tables";
  static const String assignOrderTable = "waiter/order/assign-order-table";
  static const String fetchWaiterByTable = "waiter/order/fetch-waiter-by-table";
  static const String checkOrderForTable = "waiter/order/check-order-for-table";
  static const String pastOrderList = "waiter/order/past-order-list";
  static const String paymentRecieved = "waiter/order/payment-recieved";
  static const String getCMS = "waiter/cms/get";
  static const String deleteWaiter = "waiter/auth/delete";
  static const String dashboardData = "waiter/manual-order/dashboardData";

  static const String updateLanguage = "waiter/auth/update-language";
  static const String toggleNotification = "waiter/notification/notification";
  static const String getNotification = "waiter/notification/getNotification";

}
