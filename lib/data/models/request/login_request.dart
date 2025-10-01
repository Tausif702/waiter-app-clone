class LoginRequest {
  final String countryCode;
  final String deviceToken;
  final String deviceType;  // It's a string ("1") in your example
  final String mobileNumber;
  final String password;

  LoginRequest({
    required this.countryCode,
    required this.deviceToken,
    required this.deviceType,
    required this.mobileNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "countryCode": countryCode,
      "deviceToken": deviceToken,
      "deviceType": deviceType,
      "mobileNumber": mobileNumber,
      "password": password,
    };
  }
}
