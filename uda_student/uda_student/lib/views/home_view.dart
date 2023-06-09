import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uda_qlsv/components/home/home_banners.dart';
import 'package:uda_qlsv/components/home/home_notifies.dart';
import 'package:uda_qlsv/components/home/home_tab_view.dart';
import 'package:uda_qlsv/models/notify.dart';
import 'package:uda_qlsv/views/notifies_view.dart';

import 'package:image_picker/image_picker.dart';

import '../models/home_tab.dart';
import '../services/app.service.dart';
import '../theme/color.dart';
import 'menu_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final FirebaseMessaging _messaging;
  Notify? _notificationInfo;
  List<Notify>? _listNotification;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  File? _image;
  final AppService appService = Get.find<AppService>();

  //picture
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }
  Future getCamera() async {
    final camera = await ImagePicker().pickImage(source: ImageSource.camera);
    if(camera == null) return;
    setState(() {
      this._image = File(camera.path);
    });
  }

  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();
    String? token = await FirebaseMessaging.instance.getToken();
    log("Get token succesfully: " + token!);

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
          name: message.notification?.title.toString(),
          description: message.notification?.body.toString(),
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
        if (mounted) {
          setState(() {
            _notificationInfo = notification;

            _listNotification?.add(_notificationInfo!);
          });
        }

        // For displaying the notification as an snackbar
        if (_notificationInfo != null) {
          Get.snackbar(notification.name!, notification.description!,
              icon: const Icon(Icons.notifications_active),
              backgroundColor: const Color.fromARGB(177, 1, 178, 34),
              colorText: Colors.black,
              duration: const Duration(seconds: 3), onTap: (_) {
            Get.toNamed(NotifiesView.route, arguments: _notificationInfo);
          });
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

  @override
  void initState() {
    _listNotification = [];
    registerNotification();
    checkForInitialMessage();
    // For handling notification when the app is in background
    // but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Message id ${message.data['id']} title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
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
      if (_notificationInfo != null) {
        Get.snackbar(notification.name!, notification.description!,
            icon: const Icon(Icons.notifications_active),
            backgroundColor: const Color.fromARGB(151, 23, 174, 245),
            colorText: Colors.black,
            duration: const Duration(seconds: 3), onTap: (_) {
          Get.toNamed(NotifiesView.route, arguments: _notificationInfo);
        });
      }
    });

    super.initState();
  }
  // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title:
            const Text('UDA University', style: TextStyle(color: kTextColor)),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => _key.currentState!.openDrawer(),
            icon: const Icon(Ionicons.menu_outline, color: kTextColor)),
        actions: [
          // TextButton(
          //     onPressed: () {
          //       Get.toNamed(homeTabs[1].to);
          //     },
          //     style:
          //         TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(56),
          //       child: Container(
          //        child: Row(
          //          children: [
          //            Stack(
          //              children: [
          //
          //              ],
          //            )
          //          ],
          //        ),
          //       )
          //     )
          Container(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 0, 0, 10),
                      child: Row(
                        children: [
                         TextButton(onPressed: () {
                           Get.toNamed(homeTabs[1].to);
                         },
                           child:  _image !=null ? Image.file(_image!, width: 40, height: 40, fit: BoxFit.cover,): Image.network('https://toigingiuvedep.vn/wp-content/uploads/2021/05/hinh-anh-nam-buon-chat.jpg',
                             width: 50,
                             height: 50,
                             fit:BoxFit.cover
                         ),),
                          Text(appService.user.value!.name, style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextButton(onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                       bottom: Radius.circular(20)
                                  )
                                ),
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ElevatedButton(
                                            onPressed: getImage,
                                            child: Icon(Icons.file_copy_outlined, size: 20,)
                                        ),
                                        ElevatedButton(onPressed: getCamera, child: Icon(Icons.party_mode_sharp, size: 20,)),
                                      ],
                                    ),
                                  );
                                }
                            );
                          }, child:  Icon(Icons.party_mode_sharp, size: 20,)
                          )
                        ],
                      ),
                    )

                  ],
                )
              ],
            ),
          )
        ],
      ),
      drawer: MenuDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              HomeBanners(),
              const SizedBox(height: 20),
              HomeNotifies(),
              const SizedBox(height: 20),
              //QuanLy
              const HomeTabView(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
