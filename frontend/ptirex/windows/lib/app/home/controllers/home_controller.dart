part of home;

class HomeController extends GetxController {
  late AppSnackbar appSnackBar;
  @override
  void onInit() {
    super.onInit();
    appSnackBar = AppSnackbar();
  }
}
