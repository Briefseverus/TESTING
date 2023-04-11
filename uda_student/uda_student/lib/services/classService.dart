import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uda_qlsv/models/class_name.dart';

import 'app.service.dart';

class ClassService {
  AppService appService = Get.find<AppService>();

  static Future<ClassName> getClass() async {
    final res =
    await ClassService().appService.network.get('/classnames');

    return ClassName.fromJson(res.data['data']);
  }
}