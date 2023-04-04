import 'package:get/get.dart';
import 'package:uda_qlsv/models/tuition.dart';

import 'app.service.dart';

class TuitionService {
  AppService appService = Get.find<AppService>();

  static Future<Tuition> getTuition(String id) async {
    final res =
        await TuitionService().appService.network.get('/tuitions/user/$id');

    return Tuition.fromJson(res.data['data']);
  }
}
