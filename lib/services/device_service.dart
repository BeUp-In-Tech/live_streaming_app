import 'package:dio/dio.dart';
import '../core/network/api_client.dart';

class DeviceService {
  final Dio _dio = ApiClient.dio;

  Future<Map<String, dynamic>> getDevice(String code) async {
    final res = await _dio.get("devices/$code");

    return res.data["data"];
  }

  Future<Map<String, dynamic>> linkDevice(String code, String deviceId) async {
    final res = await _dio.put(
      "devices/$code",
      queryParameters: {
        "device_id": deviceId,
        "device_status": "active",
      },
    );

    return res.data["data"];
  }
}
