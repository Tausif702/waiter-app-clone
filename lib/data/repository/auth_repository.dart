import 'package:waiter/core/ApiConstants.dart';

import '../services/api_service.dart';
import '../models/request/login_request.dart';
import '../models/response/login_response.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await apiService.postRequest(
      url: ApiConstants.login,
      data: request.toJson(),
    );

    return LoginResponse.fromJson(response.data);
  }
}
