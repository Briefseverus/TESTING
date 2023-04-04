import 'package:flutter/material.dart';
import 'package:uda_qlsv/components/welcome/login_form.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  static const String route = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 126,
              ),
              Center(child: Image.asset('assets/images/logo.png', width: 200)),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 30, right: 30, bottom: 20),
                child: LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
