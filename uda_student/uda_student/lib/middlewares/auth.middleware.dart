import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/services/app.service.dart';
import 'package:uda_qlsv/views/welcome_view.dart';

class AuthMiddleware extends GetMiddleware {
  AppService appService = Get.find<AppService>();

  @override
  redirect(String? route) {
    return !appService.$auth && route != WelcomeView.route
        ? const RouteSettings(name: WelcomeView.route)
        : null;
  }
}
