import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/components/includes/app_bar_view.dart';
import 'package:uda_qlsv/components/info/info_tab_content.dart';
import 'package:uda_qlsv/components/info/info_tab_view.dart';
import 'package:uda_qlsv/controllers/info_controller.dart';

import '../components/info/info_money.dart';

class InfoView extends StatelessWidget {
  InfoView({Key? key}) : super(key: key);

  static const String route = '/info';

  final InfoController c = Get.find<InfoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(title: 'Thông Tin Cá Nhân'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const InfoTabView(),
                const SizedBox(height: 20),
                Obx(() => c.currentTab.value == 'Thông Tin'
                    ? InfoTabContent()
                    : c.tuition.value != null
                        ? InfoMoneyView()
                        : Container())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
