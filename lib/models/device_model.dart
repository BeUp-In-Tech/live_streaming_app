class DeviceModel {
  final String deviceCode;
  final String deviceId;
  final String deviceOutput;
  final String deviceName;
  final String deviceStatus;
  final String userEmail;

  DeviceModel({
    required this.deviceCode,
    required this.deviceId,
    required this.deviceOutput,
    required this.deviceName,
    required this.deviceStatus,
    required this.userEmail,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      deviceCode: json["device_code"],
      deviceId: json["device_id"],
      deviceOutput: json["device_output"],
      deviceName: json["device_name"],
      deviceStatus: json["device_status"],
      userEmail: json["user_email"],
    );
  }
}
