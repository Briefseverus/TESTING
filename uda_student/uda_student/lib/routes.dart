import 'package:get/get.dart';
import 'package:uda_qlsv/controllers/home_controller.dart';
import 'package:uda_qlsv/controllers/info_controller.dart';
import 'package:uda_qlsv/controllers/menu_table_controller.dart';
import 'package:uda_qlsv/controllers/notifies_controller.dart';
import 'package:uda_qlsv/middlewares/auth.middleware.dart';
import 'package:uda_qlsv/views/document_view.dart';
import 'package:uda_qlsv/views/documents_view.dart';
import 'package:uda_qlsv/views/home_view.dart';
import 'package:uda_qlsv/views/info_view.dart';
import 'package:uda_qlsv/views/menu_table_view.dart';
import 'package:uda_qlsv/views/notifies_view.dart';
import 'package:uda_qlsv/views/notify_view.dart';
import 'package:uda_qlsv/views/welcome_view.dart';

import 'controllers/documents_controller.dart';
import 'controllers/welcome_controller.dart';
import 'middlewares/welcome.middleware.dart';

class RouteGenerator {
  static List<GetPage> routes = [
    GetPage(
        name: WelcomeView.route,
        page: () => const WelcomeView(),
        binding: WelcomeBinding(),
        middlewares: [WelcomeMiddleware()]),
    GetPage(
        name: HomeView.route,
        page: () => const HomeView(),
        binding: HomeBindding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: InfoView.route,
        page: () => InfoView(),
        binding: InfoBindding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: NotifiesView.route,
        page: () => NotifiesView(),
        binding: NotifiesBindding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: NotifyView.route,
        page: () => const NotifyView(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: DocumentsView.route,
        page: () => DocumentsView(),
        binding: DocumentsBindding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: DocumentView.route,
        page: () => DocumentView(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: MenuTableView.route,
        page: () => MenuTableView(),
        binding: MenuTableBindding(),
        middlewares: [AuthMiddleware()])
  ];
}

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController());
  }
}

class HomeBindding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}

class InfoBindding extends Bindings {
  @override
  void dependencies() {
    Get.put<InfoController>(InfoController());
  }
}

class NotifiesBindding extends Bindings {
  @override
  void dependencies() {
    Get.put<NotifiesController>(NotifiesController());
  }
}

class DocumentsBindding extends Bindings {
  @override
  void dependencies() {
    Get.put<DocumentsController>(DocumentsController());
  }
}

class MenuTableBindding extends Bindings {
  @override
  void dependencies() {
    Get.put<MenuTableController>(MenuTableController());
  }
}
