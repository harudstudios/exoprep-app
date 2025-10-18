class AppEndpoints {
  AppEndpoints._();

  // static const String baseURL = 'http://3.109.221.178:5432';
  static const String baseURL = 'http://localhost:3000';

  /*----------------- Auth Endpoints -------------------*/
  static String get createUser => '$baseURL/api/v1/users';

  static String get getUser => '$baseURL/api/v1/users/me';
}
