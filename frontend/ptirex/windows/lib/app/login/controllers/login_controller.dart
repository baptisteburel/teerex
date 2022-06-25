part of login;

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;

  //for loading
  final isLoading = false.obs;

  //form validation
  final isFormValid = false.obs;
  final isValidFieldEmail = false.obs;
  final isValidFieldPassword = false.obs;
  //for message toast
  late final AppSnackbar appSnackBar;
  final showPassword = false.obs;
  @override
  void onInit() {
    super.onInit();
    appSnackBar = AppSnackbar();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void updateShowPassword() {
    showPassword(!showPassword.value);
  }

  void updateFormValid() async {
    await Future.delayed(const Duration(microseconds: 1));
    isFormValid(isValidFieldEmail.value && isValidFieldPassword.value);
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      isValidFieldEmail(false);
      updateFormValid();
      return "Email invalide";
    }

    isValidFieldEmail(true);
    updateFormValid();
    return null;
  }

  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      isValidFieldPassword(false);
      updateFormValid();
      return "Mot de passe invalide";
    }

    isValidFieldPassword(true);
    updateFormValid();
    return null;
  }

//methode de login avec le dio
  Future<void> doLogin() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    AuthenticationManager authManager = Get.find();
    authManager.loginUser();
    appSnackBar.showSnackBar(this, "Vous êtes connectés avec succès.");
    Get.offNamed(Routes.home);

    isLoading(false);
  }
}
