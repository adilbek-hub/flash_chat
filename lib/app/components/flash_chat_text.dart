import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat1/app/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

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
