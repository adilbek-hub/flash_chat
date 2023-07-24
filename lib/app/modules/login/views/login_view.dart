import 'package:flash_chat1/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/animation_logo.dart';
import '../../../components/custom_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView(this.isLogin, {Key? key}) : super(key: key);
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnimationLogo(
              size: 150,
            ),
            SizedBox(height: 20),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: controller.email,
                    hintText: 'Enter your Email',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: controller.password,
                    hintText: 'Enter your Password',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              color: AppColors.whiteL,
              text: isLogin ? 'Login' : 'Register',
              borderRadius: 30,
              onPressed: () async => await controller.registerLogin(isLogin),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
  });
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: hintText,
        ),
      ),
    );
  }
}
