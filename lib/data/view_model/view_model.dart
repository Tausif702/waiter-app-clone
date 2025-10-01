import 'package:flutter/material.dart';

import '../models/request/login_request.dart';
import '../models/response/login_response.dart';
import '../repository/auth_repository.dart';

class ViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  ViewModel({required this.authRepository});

  LoginResponse? _loginResponse;
  bool _isLoading = false;
  String? _errorMessage;

  LoginResponse? get loginResponse => _loginResponse;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> login(String mobile, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final request = LoginRequest(
        password: '',
        countryCode: '',
        deviceToken: '',
        deviceType: '',
        mobileNumber: '',
      );
      final response = await authRepository.login(request);

      _loginResponse = response;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _loginResponse = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }
}
