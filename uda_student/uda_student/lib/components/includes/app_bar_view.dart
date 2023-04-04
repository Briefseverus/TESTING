import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../theme/color.dart';

class AppBarView extends StatelessWidget with PreferredSizeWidget {
  const AppBarView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title, style: const TextStyle(color: kTextColor)),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(result: true),
            icon: const Icon(Ionicons.arrow_back, color: kTextColor)));
  }

  @override
  // ignore: todo
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
