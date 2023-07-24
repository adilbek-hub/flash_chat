import 'package:flash_chat1/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../services/login_register_service.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> registerLogin(bool isLogin) async {
    if (formKey.currentState!.validate() &&
        GetUtils.isEmail(email.text) &&
        GetUtils.isPassport(password.text)) {
      Get.dialog(const CupertinoActivityIndicator());
      final user = isLogin
          ? await LoginService.login(email.text, password.text)
          : await LoginService.register(email.text, password.text);

      if (user != null) {
        await Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(title: 'Kata bar', cancel: Text('Kata bar'));
      }
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: 'Форманы туура толтуруңуз',
      ));
    }
  }
}
