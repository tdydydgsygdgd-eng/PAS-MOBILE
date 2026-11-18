import 'package:flutter_application_2/pages/mainmenu.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2/pages/loginClone.dart';

class Routes {
  // list pages yang ada di aplikasi
   static const String mainMenuPages = "/Mainmenupages";
   static const String loginClone = "/loginClone";

  // tampung kedalam array yang akan kita pasang ke main dart
  static final myPages = [
    GetPage(name: mainMenuPages, page: () => MainMenuPage()),
    GetPage(name: loginClone, page: () => LoginClone()),
  ];
}
