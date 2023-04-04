import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/routes.dart';
import 'package:uda_qlsv/services/app.service.dart';
import 'package:uda_qlsv/views/home_view.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // log("Handling a background messa4ge: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initServices();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

Future<void> initServices() async {
  // Int App, Dio,...
  await Get.putAsync<AppService>(() => AppService().init());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppService appService = Get.find<AppService>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      getPages: RouteGenerator.routes,
      initialRoute: HomeView.route,
    );
  }
}
