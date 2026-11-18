import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2/menu/profile.dart';
import 'package:flutter_application_2/menu/history.dart';
import 'package:flutter_application_2/menu/home.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listPages = [Home(), History(), Profile()];
}
