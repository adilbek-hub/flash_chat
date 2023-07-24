import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat1/app/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AnimationLogo extends StatefulWidget {
  const AnimationLogo({
    super.key,
    this.size = 100,
  });
  final double size;

  @override
  State<AnimationLogo> createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: SizedBox(
        height: controller.value * widget.size,
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
