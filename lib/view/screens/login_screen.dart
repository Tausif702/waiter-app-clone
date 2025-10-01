import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/request/login_request.dart';
import '../../data/models/response/login_response.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/services/api_service.dart';
import '../../utils/sharedPreference.dart';
import '../../utils/utiles.dart';
import '../dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  String _countryCode = '+91';
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ApiService _apiService = ApiService(); // ApiService instance
  late AuthRepository _authRepository;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _authRepository = AuthRepository(apiService: _apiService);
  }

  void _login() async {
    if (phoneController.text.isEmpty) {
      Utils.showToast('Please enter mobile number');
      return;
    }
    if (passwordController.text.isEmpty) {
      Utils.showToast('Please enter password');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final loginRequest = LoginRequest(
        countryCode: _countryCode,
        deviceToken: 'firebase_token',
        deviceType: '1',
        mobileNumber: phoneController.text.trim(),
        password: passwordController.text.trim(),
      );

      LoginResponse response = await _authRepository.login(loginRequest);

      if (response.success == true) {
        await SharedPref.setString(
          PrefKeys.userToken,
          response.data.accessToken,
        );
        await SharedPref.setBool(PrefKeys.isLogin, true);

        // Await reading the values, since these are async methods
        bool isLogin = await SharedPref.getLogin();
        String token = await SharedPref.getString(PrefKeys.userToken);

        Utils.showToast('Login Successful');
        print("data22 ==>> $isLogin And $token");

        Get.offAll(() => DashboardScreen());
      } else {
        Utils.showToast(response.message ?? 'Login failed');
      }
    } catch (e) {
      Utils.showToast('An error occurred: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 1,
                    spreadRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: CountryCodePicker(
                      onChanged: (code) {
                        setState(() {
                          _countryCode = code.dialCode ?? '+91';
                        });
                      },
                      initialSelection: 'IN',
                      favorite: ['+91', 'IN'],
                      showFlag: false,
                      showDropDownButton: true,
                      padding: EdgeInsets.zero,
                      dialogBackgroundColor: Colors.white,
                    ),
                  ),
                  Container(width: 1, height: 24, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Enter mobile number',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 1,
                    spreadRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Reset Password',
                  style: TextStyle(color: Color(0xFF218C4E)),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Utils.loginButton(
              text: _isLoading ? "Logging in..." : "Login",
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }
}
