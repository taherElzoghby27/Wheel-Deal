class ApiConsts {
  //baseurl
  static const baseUrl = 'http://192.168.1.7/car_trading_app/';

  //endpoints
  static const signUpEndpoint = 'auth/signup.php';
  static const loginEndpoint = 'auth/login.php';
  static const resetPassEndPoint = 'auth/reset_password.php';
  static const checkingForResetPasswordEndpoint =
      'auth/checking_for_reset_password.php';
  static const bestOffersEndpoint = 'home/cars.php';
  static const recommendedForYouEndPoint = 'home/cars.php';
  static const getModelTypeEndPoint = 'home/prev_car_model.php';
  static const userInfoEndpoint = 'home/user_extra_info.php';

  static const previousCarEndpoint = 'home/prev_car.php';

  static const topBrandsEndpoint = 'home/top_brands.php';
  static const carDetailsEndPoint = 'home/car_details.php';
  static const installmentAvailableEndPoint = 'home/installment_available.php';
  static const fetchFavEndPoint = 'favourite/fetch_favourite.php';
  static const addFavEndPoint = 'favourite/favourite_add.php';
  static const deleteFavEndPoint = 'favourite/delete_item.php';
  static const searchEndPoint = 'home/search.php';
  static const searchFilterEndPoint = 'home/search_filtering.php';
  static const recentSearchEndPoint = 'home/search_fetch.php';
  static const deleteRecentSearchEndPoint = 'home/search_delete.php';
  static const bodyTypeFilter = 'home/search_bodytype.php';
  static const getBrandsFilter = 'home/search_brands.php';
  static const fetchOrdersEndPoint = 'order/order_fetch.php';
  static const addOrderEndPoint = 'order/order_add.php';
  static const deleteOrderEndPoint = 'order/delete_order.php';
  static const profileEndPoint = 'profile/user_profile.php';
  static const userVerificationEndPoint = 'profile/user_verification.php';
  static const checkCodeInputEndPoint =
      'sign_in_and_security/check_code_input.php';
  static const emailVerifyEndPoint = 'sign_in_and_security/email_verify.php';
  static const updateEmailEndPoint = 'sign_in_and_security/update_email.php';
  static const updatePasswordEndPoint =
      'sign_in_and_security/update_password.php';
}
