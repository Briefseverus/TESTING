import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uda_qlsv/controllers/info_controller.dart';

import '../../theme/color.dart';
import '../../theme/input.dart';

class InfoEdutForm extends StatelessWidget {
  InfoEdutForm({Key? key}) : super(key: key);

  final InfoController c = Get.find<InfoController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Cập Nhật Thông Tin',
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                _EditField(
                    label: 'Số Điện Thoại',
                    child: TextField(
                        controller: TextEditingController()
                          ..text = c.user.value.phone,
                        cursorColor: kPrimaryColor,
                        onChanged: (String text) => c.user.value.phone = text,
                        style: TextStyle(
                            // fontWeight: FontWeight.w500
                            color: Colors.black.withOpacity(0.8)),
                        decoration: kPrimaryInput.copyWith(
                            hintText: 'Số điện thoại liên lạc',
                            prefixIcon: Icon(Ionicons.call_outline,
                                color: Colors.black.withOpacity(0.5))))),
                _EditField(
                    label: 'Số CCCD',
                    child: TextField(
                        controller: TextEditingController()
                          ..text = c.user.value.cccd,
                        cursorColor: kPrimaryColor,
                        onChanged: (String text) => c.user.value.cccd = text,
                        style: TextStyle(
                            // fontWeight: FontWeight.w500
                            color: Colors.black.withOpacity(0.8)),
                        decoration: kPrimaryInput.copyWith(
                            hintText: 'Số CCCD',
                            prefixIcon: Icon(Ionicons.at_outline,
                                color: Colors.black.withOpacity(0.5))))),
                _EditField(
                    label: 'Địa Chỉ',
                    child: TextField(
                        controller: TextEditingController()
                          ..text = c.user.value.address,
                        cursorColor: kPrimaryColor,
                        onChanged: (String text) => c.user.value.address = text,
                        style: TextStyle(
                            // fontWeight: FontWeight.w500
                            color: Colors.black.withOpacity(0.8)),
                        decoration: kPrimaryInput.copyWith(
                            hintText: 'Chỗ ở hiện tại',
                            prefixIcon: Icon(Ionicons.navigate_outline,
                                color: Colors.black.withOpacity(0.5))))),
                const SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 300),
                  child: TextButton(
                      onPressed: () => c.updateMe(),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          color: kPrimaryColor,
                          child: Center(
                            child: Text('Cập Nhật'.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14)),
                          ),
                        ),
                      )),
                ),
                const SizedBox(height: 20)
              ],
            ),
          )),
    );
  }
}

class _EditField extends StatelessWidget {
  const _EditField({Key? key, required this.label, required this.child})
      : super(key: key);

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: kTextColor)),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: child,
          )
        ],
      ),
    );
  }
}
