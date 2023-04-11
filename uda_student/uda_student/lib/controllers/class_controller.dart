//
//
// import 'package:get/get.dart';
// import 'package:uda_qlsv/models/class_name.dart';
// import 'package:uda_qlsv/services/classService.dart';
//
// import '../services/app.service.dart';
//
// class Class_Controller extends GetxController {
//   AppService appService = Get.find<AppService>();
//   late Rx<ClassName?> className = Rx<ClassName?>(null);
//
//   @override
//   void onReady() {
//     getClass();
//     super.onReady();
//   }
//   Future<void> getClass() async {
//     try {
//       className.value =
//       await ClassService.getClass();
//     } catch (_) {}
//   }
// }