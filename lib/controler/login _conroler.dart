import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2/model/model_login.dart';
import 'package:flutter_application_2/routes.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  
  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  Null get e => null;

  Future<void> login() async {
    if (txtUsername.text.trim().isEmpty || txtpassword.text.isEmpty){
      Get.snackbar('Error', 'Username and password are required');
    }
    if (isLoading.value) return;

    if (isLoading.value) return;

    try {
      isLoading.value = true;

      final url = Uri.parse("https://mediadwi.com/api/latihan/login");

      final response = await http
          .post(
            url,
            body: {
              "username": txtUsername.text.trim(),
              "password": txtpassword.text,
            },
          )
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        loginModel.value = loginModelFromJson(response.body);
        if (loginModel.value?.status == true) {
          Get.snackbar("success", loginModel.value?.message ?? "login success");
          Get.offAllNamed(Routes.loginClone);
        } else {
          Get.snackbar(
            "failed",
            loginModel.value?.message ?? "username or password is wrong",
          );
        }
      } else {
        Get.snackbar("failed", "server error");
      }
    } catch (e) {
      Get.snackbar("failed", "cannot connect to server: $e");
    } finally {
      isLoading.value = false;
    }

 @override
  void onClose() {
    txtUsername.dispose();
    txtpassword.dispose();
    super.onClose();
  }
}


}