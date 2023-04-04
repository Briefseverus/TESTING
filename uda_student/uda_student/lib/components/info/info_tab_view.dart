import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/controllers/info_controller.dart';
import 'package:uda_qlsv/theme/color.dart';

class InfoTabView extends StatelessWidget {
  const InfoTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        color: kTextBG,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            _InfoButton(title: 'Thông Tin'),
            const SizedBox(width: 10),
            _InfoButton(title: 'Học Phí'),
          ],
        ),
      ),
    );
  }
}

class _InfoButton extends StatelessWidget {
  _InfoButton({Key? key, required this.title}) : super(key: key);

  final String title;

  final InfoController c = Get.find<InfoController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => c.currentTab.value = title,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Obx(() => Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 7),
              color: c.currentTab.value == title
                  ? kPrimaryColor
                  : Colors.transparent,
              child: Center(
                  child: Text(title,
                      style: TextStyle(
                          color: c.currentTab.value == title
                              ? Colors.white
                              : kTextColor,
                          fontWeight: FontWeight.w500))))),
        ),
      ),
    );
  }
}
