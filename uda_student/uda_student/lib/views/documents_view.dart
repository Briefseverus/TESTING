import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/components/includes/app_bar_view.dart';
import 'package:uda_qlsv/components/post/post_body_view.dart';
import 'package:uda_qlsv/controllers/documents_controller.dart';
import 'package:uda_qlsv/views/document_view.dart';

import '../abstract/post.dart';

class DocumentsView extends StatelessWidget {
  DocumentsView({Key? key}) : super(key: key);

  static const String route = '/documents';

  final DocumentsController c = Get.find<DocumentsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarView(title: 'Tài Liệu'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Obx(() => c.list.isEmpty
                      ? Container()
                      : PostBodyView(
                          posts: c.list,
                          onClick: (Post post) {
                            Get.toNamed(DocumentView.route, arguments: post);
                          },
                        ))
                ],
              ),
            ),
          ),
        ));
  }
}
