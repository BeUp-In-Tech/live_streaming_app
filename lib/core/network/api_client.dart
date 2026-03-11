import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://devicetronix.net/api/",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Authorization":
            "Bearer 8|YdyOZv4CkRjhIp01U5k4sGrm40GyF5tL9zWQDXwk34b60a2f",
        "Accept": "application/json",
      },
    ),
  );
}
