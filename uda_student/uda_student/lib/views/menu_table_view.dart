import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/controllers/menu_table_controller.dart';
import 'package:uda_qlsv/models/menu_table.dart';

import '../components/includes/app_bar_view.dart';

class MenuTableView extends StatelessWidget {
  MenuTableView({Key? key}) : super(key: key);

  static String route = '/menu_table';

  final MenuTableController c = Get.find<MenuTableController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarView(title: 'Thời Khoá Biểu'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: const Center(
                                  child: Text('Thứ/Tuần'),
                                ),
                              ),
                              flex: 2,
                              fit: FlexFit.tight,
                            ),
                            Flexible(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: const Center(
                                  child: Text('Sáng'),
                                ),
                              ),
                              flex: 4,
                              fit: FlexFit.tight,
                            ),
                            Flexible(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: const Center(
                                  child: Text('Chiều'),
                                ),
                              ),
                              flex: 4,
                              fit: FlexFit.tight,
                            )
                          ],
                        ),
                        Obx(() => c.groupByTime.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: c.groupByTime.length,
                                itemBuilder: (ctx, index) => Row(
                                      children: [
                                        // Thứ
                                        Flexible(
                                          child: Container(
                                            height: 100,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1)),
                                            child: Center(
                                              child: Text('Thứ ${index + 2}'),
                                            ),
                                          ),
                                          flex: 2,
                                          fit: FlexFit.tight,
                                        ),

                                        Flexible(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            height: 100,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1)),
                                            child: Center(
                                              child: _TableItemView(
                                                  menu: c
                                                          .groupByTime[
                                                              index.toString()]
                                                          ?.morning ??
                                                      []),
                                            ),
                                          ),
                                          flex: 4,
                                          fit: FlexFit.tight,
                                        ),

                                        Flexible(
                                          child: Container(
                                            height: 100,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1)),
                                            child: Center(
                                              child: _TableItemView(
                                                  menu: c
                                                          .groupByTime[
                                                              index.toString()]
                                                          ?.afternoon ??
                                                      []),
                                            ),
                                          ),
                                          flex: 4,
                                          fit: FlexFit.tight,
                                        )
                                      ],
                                    ))
                            : Container())
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _TableItemView extends StatelessWidget {
  const _TableItemView({Key? key, required this.menu}) : super(key: key);

  final List<MenuTable> menu;

  String label(MenuTable e) {
    String text = e.subject.name + ' - Tiết: ';

    for (var element in e.stage) {
      text += ' $element';
      if (element != e.stage.last) {
        text += ',';
      }
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: menu.map((e) => Text(label(e))).toList(),
      ),
    );
  }
}
