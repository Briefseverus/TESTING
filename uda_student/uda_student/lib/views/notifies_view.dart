import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/components/includes/app_bar_view.dart';
import 'package:uda_qlsv/components/post/post_body_view.dart';
import 'package:uda_qlsv/controllers/notifies_controller.dart';
import 'package:uda_qlsv/views/notify_view.dart';

import '../abstract/post.dart';

class NotifiesView extends StatelessWidget {
  NotifiesView({Key? key}) : super(key: key);

  static const String route = '/notifies';

  final NotifiesController c = Get.find<NotifiesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarView(title: 'Danh Sách Thông Báo'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Obx(() => c.list.isEmpty
                      ? Container()
                      : PostBodyView(
                          posts: c.list,
                          onClick: (Post post) {
                            Get.toNamed(NotifyView.route, arguments: post);
                          },
                        ))
                ],
              ),
            ),
          ),
        ));
  }
}
