import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/models/user.dart';
import 'package:uda_qlsv/views/welcome_view.dart';

class AppService extends GetxService {
  Rx<User?> user = Rx<User?>(null);
  String? _token;

  bool get $auth {
    return user.value != null;
  }

  // Create storage
  // Todo: Config android
  FlutterSecureStorage storage = const FlutterSecureStorage();

  final Dio _dio = Dio();

  Future<AppService> init() async {
    // Apply Middleware
    setInterceptor();
    await checkUser();
    return this;
  }

  Dio get network {
    _dio.options.headers['Authorization'] = 'Bearer $_token';
    // Link API
    // https://api-qlsinhvien.herokuapp.com/
    _dio.options.baseUrl = 'http://192.168.1.5:3000/';
    // _dio.options.baseUrl = 'https://api-qlsinhvien.herokuapp.com/';

    return _dio;
  }

  void setInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (kDebugMode) {
        print('Request to ${options.path}');
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        print('Response from ${response.requestOptions.path}');
      }
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      if (kDebugMode) {
        if (e.response?.data['msg'] != null) {
          Get.snackbar('Lỗi', e.response?.data['msg'],
              backgroundColor: Colors.redAccent, colorText: Colors.white);
        }
        print('Error from ${e.response?.requestOptions.path}');
      }
      return handler.next(e);
    }));
  }

  Future<void> checkUser() async {
    _token = await storage.read(key: 'jwt');
    if (_token != null) {
      await onLogin(_token!);
    }
  }

  Future<void> logOut() async {
    _token = null;
    user.value = null;
    await storage.delete(key: 'jwt');
    Get.offNamed(WelcomeView.route);
  }

  Future<void> onLogin(String token) async {
    if (kDebugMode) {
      print('SignIn with token: $token');
    }
    // gi token
    await storage.write(key: 'jwt', value: token);
    _token = token;

    try {
      user.value = await getMe();
    } catch (_) {
      // Xoá token khi không hợp lệ
      _token = null;
      user.value = null;
      await storage.delete(key: 'jwt');
    }
  }

  Future<User> getMe() async {
    final res = await network.get('/users/me');
    return User.fromJson(res.data['data']);
  }
}
