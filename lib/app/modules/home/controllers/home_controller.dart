import 'package:flash_chat1/app/modules/home/service/home_service.dart';
import 'package:flash_chat1/app/routes/app_pages.dart';
import 'package:flash_chat1/utils/app_shows.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<void> logout() async {
    AppShows.showIndicator();
    await HomeService.logout();
    await Get.offAllNamed(Routes.FLASH_CHAT);
  }

  Future<void> delete() async {
    AppShows.showIndicator();
    await HomeService.delete();
    await Get.offAllNamed(Routes.FLASH_CHAT);
  }
}
