import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/services/app.service.dart';
import 'package:uda_qlsv/views/info_view.dart';
import 'package:uda_qlsv/views/menu_table_view.dart';
import 'package:uda_qlsv/views/notifies_view.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key}) : super(key: key);

  final AppService appService = Get.find<AppService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Center(
            child: Image.asset('assets/images/logo.png', width: 170),
          )),
          ListTile(
            title: const Text('Thông Tin Cá Nhân'),
            onTap: () {
              Get.toNamed(InfoView.route);
            },
          ),
          ListTile(
            title: const Text('Thông Báo'),
            onTap: () {
              Get.toNamed(NotifiesView.route);
            },
          ),
          ListTile(
            title: const Text('Thời Khoá Biểu'),
            onTap: () {
              Get.toNamed(MenuTableView.route);
            },
          ),
          ListTile(
            title: const Text('Đăng Xuất'),
            onTap: () => appService.logOut(),
          ),
        ],
      ),
    );
  }
}
