import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uda_qlsv/components/includes/app_bar_view.dart';
import 'package:uda_qlsv/models/notify.dart';
import 'package:uda_qlsv/theme/text.dart';

import '../theme/color.dart';

class NotifyView extends StatefulWidget {
  const NotifyView({Key? key}) : super(key: key);

  static const String route = '/notify';

  @override
  State<NotifyView> createState() => _NotifyViewState();
}

class _NotifyViewState extends State<NotifyView> {
  late final FirebaseMessaging _messaging;
  Notify? _notificationInfo;
  List<Notify>? _listNotification;
  // ignore: unused_field
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();

    String? token = await FirebaseMessaging.instance.getToken();
    log(token.toString());

    // FirebaseMessaging.instance.getToken().then((token) {
    //   print('FCM TOKEN:');
    //   print(token);
    //   print('END');
    // });

    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');

      // ignore: todo
      // TODO: handle the received notifications
      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log('Message id ${message.data['id']} title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
        // Parse the message received
        Notify notification = Notify(
          id: message.data['id'],
          name: message.notification?.title,
          description: message.notification?.body,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
        if (mounted) {
          setState(() {
            _notificationInfo = notification;

            _listNotification?.add(_notificationInfo!);
          });
        }

        // For displaying the notification as an overlay

        if (_notificationInfo != null) {
          Get.snackbar(notification.name!, notification.description!,
              icon: const Icon(Icons.notifications_active),
              backgroundColor: const Color.fromARGB(177, 1, 178, 34),
              colorText: Colors.black,
              duration: const Duration(seconds: 3));
        }
      });
    } else {
      log('User declined or has not accepted permission');
    }
  }

  // For handling notification when the app is in terminated state
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      Notify notification = Notify(
        id: initialMessage.data['id'],
        name: initialMessage.notification?.title,
        description: initialMessage.notification?.body,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      setState(() {
        _notificationInfo = notification;

        _listNotification?.add(_notificationInfo!);
      });
    }
  }

  //Handling notifications on the screen, set to delete all notifications.
  deleteAllNotification() {
    setState(() {
      _notificationInfo = null;
      _listNotification?.clear();
    });
    log('Deleted all notifications');
  }

  deleteNotifcation(String id) {
    setState(() {
      _listNotification?.removeWhere((element) => element.id == id);
    });
    log('Deleted notification with id: $id');
  }

  @override
  void initState() {
    _listNotification = [];
    registerNotification();
    checkForInitialMessage();
    // For handling notification when the app is in background
    // but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Message id ${message.data['id']}, title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
      Notify notification = Notify(
        id: message.data['id'],
        name: message.notification?.title,
        description: message.notification?.body,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      setState(() {
        _notificationInfo = notification;

        _listNotification?.add(_notificationInfo!);
      });
    });

    super.initState();
  }

  final Notify document = Get.arguments;

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
            ],
          ),
        ),
      ),
    );
  }
}
