import 'package:get/get.dart';

class AuthenticationManager extends GetxController {
  final isLogged = false.obs;

  void logOutUser() {
    isLogged(false);
  }

  void loginUser() {
    isLogged(true);
  }
}
