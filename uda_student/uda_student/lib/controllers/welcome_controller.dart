import 'package:get/get.dart';
import 'package:uda_qlsv/services/app.service.dart';
import 'package:uda_qlsv/views/home_view.dart';

import '../services/user.service.dart';

class WelcomeController extends GetxController {
  RxString mssv = RxString('');
  RxString password = RxString('');

  RxBool showPass = RxBool(false);

  RxBool loading = RxBool(false);

  AppService appService = Get.find<AppService>();

  Future<void> login() async {
    if (mssv.isEmpty || password.isEmpty || loading.isTrue) {
      return;
    }
    loading.value = true;
    try {
      String token = await UserService.login(mssv.value, password.value);

      await appService.onLogin(token);

      if (appService.$auth) {
        Get.offNamed(HomeView.route);
      }
    } catch (_) {}
    loading.value = false;
  }
}
