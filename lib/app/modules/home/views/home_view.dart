import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('⚡️Chat'),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text('Login out'),
                        onTap: () async => await controller.logout(),
                      ),
                      PopupMenuItem(
                        child: const Text('Delete'),
                        onTap: () async => await controller.delete(),
                      )
                    ])
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            MessageStream(),
            SendContainer(
              controller: controller.smsController,
              onPressed: () async => controller.sendMessage(),
            ),
          ],
        ));
  }
}

class SendContainer extends StatelessWidget {
  const SendContainer({
    Key? key,
    this.onPressed,
    this.controller,
  }) : super(key: key);
  final void Function()? onPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              minLines: 2,
              maxLines: 5,
              controller: controller,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purple,
            Colors.pink,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
      ),
    );
  }
}
