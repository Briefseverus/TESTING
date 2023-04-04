import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/controllers/home_controller.dart';
import 'package:uda_qlsv/theme/color.dart';
import 'package:uda_qlsv/views/notify_view.dart';

import '../../theme/text.dart';

class HomeNotifies extends StatelessWidget {
  HomeNotifies({Key? key}) : super(key: key);

  final HomeController c = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Thông Báo', style: kTextTitle),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: kTextBG,
              padding: const EdgeInsets.all(20),
              child: Obx(() => c.list.isNotEmpty ? _Notifies() : Container()),
            ),
          )
        ],
      ),
    );
  }
}

class _Notifies extends StatelessWidget {
  _Notifies({
    Key? key,
  }) : super(key: key);

  final HomeController c = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: true,
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: c.list.length <= 5 ? c.list.length : 5,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: () => Get.toNamed(NotifyView.route, arguments: c.list[index]),
          child: Text(
            c.list[index].name.toString(),
            style: const TextStyle(
                color: kTextColor, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
