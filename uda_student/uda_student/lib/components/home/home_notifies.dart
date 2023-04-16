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
              constraints: BoxConstraints(maxHeight: 200),
              color: kTextBG,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Obx(() => c.list.isNotEmpty ? _Notifies() : Container()),
              ),
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
    return Column(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          primary: true,
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: c.list.length <= 5 ? c.list.length : 5,
          itemBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: InkWell(
                onTap: () =>
                    Get.toNamed(NotifyView.route, arguments: c.list[index]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    c.list[index].name.toString(),
                    style: const TextStyle(
                        color: kTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}