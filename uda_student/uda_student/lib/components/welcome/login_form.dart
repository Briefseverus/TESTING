import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uda_qlsv/controllers/welcome_controller.dart';
import 'package:uda_qlsv/theme/color.dart';

import '../../theme/input.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final WelcomeController c = Get.find<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: TextField(
                cursorColor: kPrimaryColor,
                onChanged: (String text) => c.mssv.value = text,
                style: TextStyle(
                    // fontWeight: FontWeight.w500
                    color: Colors.black.withOpacity(0.8)),
                decoration: kPrimaryInput.copyWith(
                    hintText: 'MSSV',
                    prefixIcon: Icon(Ionicons.at_outline,
                        color: Colors.black.withOpacity(0.5)))),
          ),
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Obx(() => TextField(
                obscureText: !c.showPass.isTrue,
                enableSuggestions: false,
                autocorrect: false,
                cursorColor: Colors.grey,
                onChanged: (String text) => c.password.value = text,
                style: TextStyle(
                    // fontWeight: FontWeight.w500
                    color: Colors.black.withOpacity(0.8)),
                decoration: kPrimaryInput.copyWith(
                    hintText: c.showPass.isTrue ? 'password' : '********',
                    prefixIcon: Icon(Ionicons.lock_closed_outline,
                        color: Colors.black.withOpacity(0.5)),
                    suffixIcon: GestureDetector(
                      onTap: () => c.showPass.value = !c.showPass.value,
                      child: Icon(
                          c.showPass.isTrue
                              ? Ionicons.eye_off_outline
                              : Ionicons.eye_outline,
                          color: Colors.black.withOpacity(0.5)),
                    )))),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('Quên mật khẩu?',
                  style: TextStyle(color: kPrimaryColor)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Obx(() => AnimatedOpacity(
                  opacity: c.loading.isTrue ? 0.5 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: TextButton(
                      onPressed: () => c.login(),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          color: kPrimaryColor,
                          child: Center(
                            child: Text('Đăng Nhập'.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14)),
                          ),
                        ),
                      )),
                )),
          ),
        ],
      ),
    );
  }
}
