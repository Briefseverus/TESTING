import 'package:get/get.dart';
import 'package:uda_qlsv/services/app.service.dart';

import '../models/user.dart';

class UserService {
  AppService appService = Get.find<AppService>();

  static Future<String> login(String idsv, String password) async {
    final response = await UserService()
        .appService
        .network
        .post('/users/login', data: {'idsv': idsv, 'password': password});

    return response.data["data"] as String;
  }

  //create register
  static Future<String> register(String idsv, String password, String name, String department, String cccd, String address, String phone, String className) async {
    final response = await UserService()
        .appService
        .network
        .post('/users',
        data: {
          'idsv': idsv,
          'password': password,
          'name': name,
          'department': department,
          'cccd': cccd,
          'phone': phone,
          'address': address,
          'className': className
        });

    return response.data["data"] as String;
  }

  static Future<User> getUserByIDAndPass(String idsv, String password) async {
    final response = await UserService()
        .appService
        .network
        .post('/users/login', data: {'idsv': idsv, 'password': password});

    return User.fromJson(response.data['user']);
  }

  static Future<User> updateUser(
      String idsv, String cccd, String phone, String address, String department) async {
    final res = await UserService().appService.network.patch(
        '/users/update/$idsv',
        data: {'cccd': cccd, 'phone': phone, 'address': address, 'department': department});
    return User.fromJson(res.data['data']);
  }
}
