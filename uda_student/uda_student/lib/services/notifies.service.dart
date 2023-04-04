import 'package:get/get.dart';
import 'package:uda_qlsv/models/notify.dart';

import 'app.service.dart';

class NotifiesService {
  AppService appService = Get.find<AppService>();

  static Future<List<Notify>> getNotifies() async {
    final res =
        await NotifiesService().appService.network.get('/notifications');

    List<Notify> notifies = <Notify>[];

    List<dynamic> list = res.data['data'];

    for (var element in list) {
      notifies.add(Notify.fromJson(element));
    }

    return notifies;
  }

  static Future<List<Notify>> homeNotifies() async {
    final res = await NotifiesService()
        .appService
        .network
        // .get('/notifications/paginate', queryParameters: {"size": size});
        .get('/notifications');

    List<Notify> notifies = <Notify>[];

    List<dynamic> list = res.data['data'];

    for (var element in list) {
      notifies.add(Notify.fromJson(element));
    }

    return notifies;
  }

  static void removeNotify(String? id) {
    NotifiesService().appService.network.delete('/notifications/$id');
  }
}
