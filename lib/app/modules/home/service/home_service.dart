import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat1/services/service_manager.dart';

class HomeService {
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await userManager.removeUid();
  }

  static Future<void> delete() async {
    await FirebaseAuth.instance.currentUser!.delete();
    await userManager.removeUid();
  }
}
