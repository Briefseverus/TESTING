import 'package:get/get.dart';
import 'package:uda_qlsv/models/menu_table.dart';

import 'app.service.dart';

class MenuTableService {
  AppService appService = Get.find<AppService>();

  static Future<List<MenuTable>> getFullWeak(String id) async {
    final res =
        await MenuTableService().appService.network.get('/timetables/user/$id');

    List<MenuTable> notifies = <MenuTable>[];

    List<dynamic> list = res.data['data'];

    for (var element in list) {
      notifies.add(MenuTable.fromJson(element));
    }

    return notifies;
  }
}
