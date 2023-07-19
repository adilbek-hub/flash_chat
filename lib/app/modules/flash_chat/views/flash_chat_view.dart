import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat1/constants/app_colors.dart';
import 'package:flash_chat1/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 70,
                ),
                const FlashChatText(),
              ],
            ),
            const SizedBox(height: 15),
            const CustomButton(text: 'Login', color: AppColors.whiteL),
            const SizedBox(height: 15),
            const CustomButton(
              text: 'Register',
              color: AppColors.whiteR,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.text,
  });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(MediaQuery.of(context).size.width - 30, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 10,
        shadowColor: Colors.blue,
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}

class FlashChatText extends StatelessWidget {
  const FlashChatText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTextStyles.flashChat,
      child: AnimatedTextKit(
        totalRepeatCount: 2000,
        animatedTexts: [
          WavyAnimatedText('Flash chat'),
        ],
        isRepeatingAnimation: true,
        onTap: () {},
      ),
    );
  }
}
