import 'package:flash_chat1/app/constants/app_colors.dart';

import 'package:flash_chat1/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/animation_logo.dart';
import '../../../components/custom_button.dart';
import '../../../components/flash_chat_text.dart';
import '../controllers/flash_chat_controller.dart';

class FlashChatView extends GetView<FlashChatController> {
  const FlashChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffafafaf),
        title: const Text('FlashChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimationLogo(),
                FlashChatText(),
              ],
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: 'Login',
              color: AppColors.whiteL,
              onPressed: () => Get.toNamed(
                Routes.LOGIN,
                arguments: true,
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: 'Register',
              color: AppColors.whiteR,
              onPressed: () => Get.toNamed(
                Routes.LOGIN,
                arguments: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
