import 'package:flash_chat1/app/routes/app_pages.dart';
import 'package:flash_chat1/services/service_manager.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../../../utils/app_shows.dart';
import '../services/login_register_service.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> registerLogin(bool isLogin) async {
    if (formKey.currentState!.validate() &&
        GetUtils.isEmail(email.text) &&
        GetUtils.isPassport(password.text)) {
      AppShows.showIndicator();
      final user = isLogin
          ? await LoginService.login(email.text, password.text)
          : await LoginService.register(email.text, password.text);
      Get.back();

      if (user != null) {
        await userManager.setUid(user.user!.uid);
        await Get.offAllNamed(Routes.HOME);
      } else {
        AppShows.showDialog(
            isLogin ? 'Сиз логин пролду туура эмес жаздыңыз!' : 'Ката бар',
            'Kata bar');
      }
    } else {
      AppShows.showSnackbar('Форманы туура толтуруңуз');
    }
  }
}
