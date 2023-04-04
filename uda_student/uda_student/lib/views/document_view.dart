import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/components/includes/app_bar_view.dart';
import 'package:uda_qlsv/models/document.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/color.dart';
import '../theme/text.dart';

class DocumentView extends StatelessWidget {
  DocumentView({Key? key}) : super(key: key);

  static const String route = '/document';

  final Document document = Get.arguments;

  Future<void> openBrowser() async {
    try {
      // Link server save document upload
      // https://api-qlsinhvien.herokuapp.com/
      // final url = "https://api-qlsinhvien.herokuapp.com/uploads/document/${document.content}";
      final url = "http://192.168.1.5:3000/${document.content}";
      if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: 'Chi Tiết Thông Báo'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(document.name!, style: kTextTitle),
              const SizedBox(height: 15),
              Text(
                document.description!,
                style: const TextStyle(
                    color: kTextColor, fontSize: 15, height: 1.4),
              ),
              const SizedBox(height: 30),
              AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 300),
                child: TextButton(
                    onPressed: () => openBrowser(),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity,
                        color: kPrimaryColor,
                        child: Center(
                          child: Text('Tải Về'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
