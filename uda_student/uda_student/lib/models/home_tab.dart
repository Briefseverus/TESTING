import 'dart:ui';

import 'package:uda_qlsv/views/documents_view.dart';
import 'package:uda_qlsv/views/info_view.dart';
import 'package:uda_qlsv/views/menu_table_view.dart';
import 'package:uda_qlsv/views/notifies_view.dart';

class HomeTab {
  String image;
  String title;
  String to;
  Color color;

  HomeTab(
      {required this.image,
      required this.title,
      required this.to,
      required this.color});
}

List<HomeTab> homeTabs = [
  HomeTab(
      image: 'assets/images/alarm.png',
      title: 'Thông Báo',
      to: NotifiesView.route,
      color: const Color(0xFFFF6B6B)),
  HomeTab(
      image: 'assets/images/user.png',
      title: 'Thông Tin',
      to: InfoView.route,
      color: const Color(0xFFFFD93D)),
  HomeTab(
      image: 'assets/images/book.png',
      title: 'Tài Liệu',
      to: DocumentsView.route,
      color: const Color(0xFF6BCB77)),
  HomeTab(
      image: 'assets/images/calendar.png',
      title: 'Lịch Học',
      to: MenuTableView.route,
      color: const Color(0xFF4D96FF))
];
