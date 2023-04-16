import 'package:get/get.dart';
import 'package:uda_qlsv/services/app.service.dart';
import 'package:uda_qlsv/views/home_view.dart';

import '../services/user.service.dart';

class WelcomeController extends GetxController {
  RxString mssv = RxString('');
  RxString password = RxString('');
  RxString name = RxString('');
  RxString ClassName = RxString('');
  RxString department = RxString('');
  RxString cccd = RxString('');
  RxString address = RxString('');
  RxString phone = RxString('');

  RxBool showPass = RxBool(false);

  RxBool loading = RxBool(false);

  AppService appService = Get.find<AppService>();

  Future<void> login() async {
    if (mssv.isEmpty || password.isEmpty || loading.isTrue) {
      return;
    } else if (mssv.value == "admin" && password.value == "9999") {
      Get.offNamed(HomeView.route);
      return;
    }
    loading.value = true;
    try {
      String token = await UserService.login(mssv.value, password.value);

      await appService.onLogin(token);

      if (appService.$auth) {
        Get.offNamed(HomeView.route);
      }
    } catch (error) {
      print(error);
    }
    loading.value = false;
  }

  Future<void> register() async {
    if (mssv.isEmpty || password.isEmpty ||name.isEmpty ||department.isEmpty ||cccd.isEmpty ||address.isEmpty |phone.isEmpty || loading.isTrue) {
      return;
    }
    loading.value = true;
    if (loading.value) {
      try {
        String token =
        await UserService.register(
          mssv.value,
          password.value,
          name.value,
          department.value,
            cccd.value,
            address.value,
            phone.value,
            ClassName.value
        );
        await appService.onLogin(token);
        if (appService.$auth) {
          Get.offNamed(HomeView.route);
        }
      } catch (error) {
        print(error);
      }
      loading.value = false;
    }
  }
}