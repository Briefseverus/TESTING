import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/components/info/info_edit_form.dart';
import 'package:uda_qlsv/models/tuition.dart';
import 'package:uda_qlsv/models/user.dart';
import 'package:uda_qlsv/services/app.service.dart';
import 'package:uda_qlsv/services/user.service.dart';

import '../services/tuition.service.dart';

class InfoController extends GetxController {
  RxString currentTab = RxString('Thông Tin');

  late Rx<User> user;
  RxBool loading = RxBool(false);

  AppService appService = Get.find<AppService>();

  late Rx<Tuition?> tuition = Rx<Tuition?>(null);

  @override
  void onReady() {
    getHocPhi();
    super.onReady();
  }

  Future<void> getHocPhi() async {
    try {
      tuition.value =
          await TuitionService.getTuition(appService.user.value!.idsv);
    } catch (_) {}
  }

  void openEdit() async {
    if (loading.isTrue) {
      return;
    }

    user = Rx<User>(appService.user.value!);

    Get.bottomSheet(
      InfoEdutForm(),
      barrierColor: Colors.black.withOpacity(0.2),
      enableDrag: false,
    );
  }

  Future<void> updateMe() async {
    if (loading.isTrue ||
        user.value.cccd.isEmpty ||
        user.value.address.isEmpty ||
        user.value.phone.isEmpty) {
      return;
    }

    loading.value = true;
    try {
      appService.user.update((val) {
        val?.name = user.value.name;
        val?.phone = user.value.phone;
        val?.address = user.value.address;
      });

      appService.user.refresh();

      Get.back();

      final _user = await UserService.updateUser(user.value.idsv,
          user.value.cccd, user.value.phone, user.value.address);


      Get.snackbar('Thành công', 'Đã thay dổi thông tin của bạn',
          backgroundColor: Colors.green, colorText: Colors.white);

      loading.value = false;
    } catch (_) {}
  }
}
