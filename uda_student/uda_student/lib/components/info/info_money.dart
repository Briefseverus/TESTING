import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/info_controller.dart';
import 'info_item_view.dart';

class InfoMoneyView extends StatelessWidget {
  InfoMoneyView({Key? key}) : super(key: key);

  final InfoController c = Get.find<InfoController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InfoItemView(label: 'Tổng Số Học Phí', content: '${c.tuition.value!.totalTuition} VNĐ'),
        ),

        const Divider(),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InfoItemView(label: 'Số Học Phí Đã Nộp', content: '${ c.tuition.value!.feePaid} VNĐ'),
        ),

        const Divider(),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InfoItemView(label: 'Số Học Phí Còn Nợ', content: '${c.tuition.value!.totalTuition - c.tuition.value!.feePaid} VNĐ'),
        ),

      ],
    );
  }
}
