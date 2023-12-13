import 'package:get_storage/get_storage.dart';
class Constant {
  static const String prodUrl = "";
  // static const String testUrl = "https://103.30.74.127:8050/api";
  static const String testUrl = "https://dev-purapi.hrishabraj.in/api";
  static const String baseUrl = testUrl;
  static const String apiKey =
      "bd1a1ccf8095037f361a4d351e7c0de65f0776bfc2f478ea8d312c763bb6caca";
  static final GetStorage storage = GetStorage();
  static final GetStorage staticStorage = GetStorage("static");
  static String token = storage.read("token");
  static String androidVersion = "1.0.0";
  static String iosVersion = "1.0.0"; 
  static String appVersion = "1.0.0";
}
