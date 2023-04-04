import 'package:get/get.dart';
import 'package:uda_qlsv/models/document.dart';

import 'app.service.dart';

class DocumentService {
  AppService appService = Get.find<AppService>();

  static Future<List<Document>> getDocuments() async {
    final res = await DocumentService().appService.network.get('/documents');

    List<Document> notifies = <Document>[];

    List<dynamic> list = res.data['data'];

    for (var element in list) {
      notifies.add(Document.fromJson(element));
    }

    return notifies;
  }
}
