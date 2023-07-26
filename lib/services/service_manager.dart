import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  late final SharedPreferences pref;
  static const uidKey = 'uid_key';
  Future<bool> init() async {
    //Эгер тиркеме ачылганда uidни оку
    pref = await SharedPreferences.getInstance();
    final uid = pref.getString(uidKey);
    // if (uid != null) {
    //   return true;
    // } else {
    //   return false;
    // }

    //Эгер uidси бар болсо HomePageге жибер
    //Эгер uid жок болсо flash_chatка жибер
    return uid != null;
  }

  //Эгер колдонуучу логин же регистрация болсо uidсин кешке сактасын
  Future<void> setUid(String uid) async {
    await pref.setString(uidKey, uid);
  }

// Эгер колдонуучу logout же delete болсо uidси өчүп калсын
  Future<void> removeUid() async {
    await pref.remove(uidKey);
  }
}

final userManager = UserManager();
