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
  static const topBrandsEndpoint = 'home/top_brands.php';
  static const carDetailsEndPoint = 'home/car_details.php';
  static const installmentAvailableEndPoint = 'home/installment_available.php';
  static const fetchFavEndPoint = 'favourite/fetch_favourite.php';
  static const addFavEndPoint = 'favourite/favourite_add.php';
  static const deleteFavEndPoint = 'favourite/delete_item.php';
  static const searchEndPoint = 'home/search.php';
  static const recentSearchEndPoint = 'home/search.php';
}
