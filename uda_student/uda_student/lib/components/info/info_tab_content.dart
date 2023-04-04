import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/components/info/info_item_view.dart';
import 'package:uda_qlsv/controllers/info_controller.dart';
import 'package:uda_qlsv/services/app.service.dart';

import '../../theme/color.dart';

class InfoTabContent extends StatelessWidget {
  InfoTabContent({Key? key}) : super(key: key);

  final AppService appService = Get.find<AppService>();
  final InfoController c = Get.find<InfoController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InfoItemView(
              label: 'Họ Và Tên', content: appService.user.value!.name),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InfoItemView(
              label: 'Mã Số Sinh Viên', content: appService.user.value!.idsv),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InfoItemView(
              label: 'Lớp', content: appService.user.value!.className.name),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InfoItemView(
              label: 'Khoa', content: appService.user.value!.department),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Obx(() => InfoItemView(
              label: 'Số CCCD', content: appService.user.value!.cccd)),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Obx(() => InfoItemView(
              label: 'Địa Chỉ', content: appService.user.value!.address)),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Obx(() => InfoItemView(
              label: 'Số Điện Thoại', content: appService.user.value!.phone)),
        ),
        const SizedBox(height: 50),
        Obx(() => AnimatedOpacity(
              opacity: c.loading.isTrue ? 0.5 : 1,
              duration: const Duration(milliseconds: 300),
              child: TextButton(
                  onPressed: () => c.openEdit(),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      width: double.infinity,
                      color: kPrimaryColor,
                      child: Center(
                        child: Text('Cập nhật thông tin'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  )),
            )),
      ],
    );
  }
}
