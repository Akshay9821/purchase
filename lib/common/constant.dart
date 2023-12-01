import 'package:get_storage/get_storage.dart';

class Constant {
  static const String prodUrl = "";
  static const String testUrl = "";
  static const String baseUrl = testUrl;
  static const String apiKey =
      "";
  static final GetStorage storage = GetStorage();
  static String token = storage.read("token");
  static String appVersion = "1.0.0";
}
