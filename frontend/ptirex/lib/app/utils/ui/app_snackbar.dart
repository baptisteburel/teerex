part of ui_utils;

/// contains all snackbar templates
class AppSnackbar {
  void showSnackBar(
    context,
    String message,
  ) {
    Get.snackbar(
      "Success",
      message,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green[800],
      margin: const EdgeInsets.all(0),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }

  void showSnackBarError(
    context,
    String message,
  ) {
    Get.snackbar(
      "Erreur",
      message,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red[400],
      margin: const EdgeInsets.all(0),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
