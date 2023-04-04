import 'package:get/get.dart';
import 'package:uda_qlsv/models/menu_table.dart';
import 'package:uda_qlsv/services/menu_table.service.dart';

import '../services/app.service.dart';

class MenuTableController extends GetxController {
  AppService appService = Get.find<AppService>();

  RxList<MenuTable> menus = RxList<MenuTable>();

  RxMap<String, MenuByDay> groupByTime = RxMap<String, MenuByDay>();

  @override
  void onInit() {
    configView();
    super.onInit();
  }

  Future<void> configView() async {
    final _menus =
        await MenuTableService.getFullWeak(appService.user.value!.idsv);
    menus.addAll(_menus);
    menus.refresh();

    RxMap<String, List<MenuTable>> groupByDay =
        RxMap<String, List<MenuTable>>();

    for (var element in menus) {
      if (groupByDay["${element.day}"] == null) {
        groupByDay["${element.day}"] = [element];
      } else {
        groupByDay["${element.day}"]?.add(element);
      }
    }

    groupByDay.forEach((key, value) {
      groupByTime[key] = MenuByDay(morning: [], afternoon: []);

      for (var element in value) {
        if (element.session == 1) {
          groupByTime[key]?.morning.add(element);
        } else {
          groupByTime[key]?.afternoon.add(element);
        }
      }
      // sort
      //groupByTime[key]?.morning.sort((a, b) => a.);
    });

    groupByTime.refresh();
  }
}

/// 1 ngày
class MenuByDay {
  List<MenuTable> morning;
  List<MenuTable> afternoon;

  MenuByDay({required this.morning, required this.afternoon});
}
