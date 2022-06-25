part of register;

class RegisterController extends GetxController {
  late TextEditingController firstNameController,
      lastNameController,
      emailController,
      passwordController,
      repeatPasswordController,
      pseudoController;

  final showPassword = false.obs;
  final isLoading = false.obs;

  //form validation
  final isFormValid = false.obs;
  final isConfidentialChecked = false.obs;
  final isValidFieldFirstName = false.obs;
  final isValidFieldLastName = false.obs;
  final isValidFieldPseudo = false.obs;
  final isValidFieldPassword = false.obs;
  final isValidFieldRepeatPassword = false.obs;
  final isValidFieldEmail = false.obs;
  final checkPart = false.obs;
  final checkCher = false.obs;

  //checkbox focus node
  late final FocusNode checkboxFocusNode;
  late AppSnackbar appSnackBar;
  @override
  void onInit() {
    super.onInit();
    appSnackBar = AppSnackbar();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    pseudoController = TextEditingController();
    checkboxFocusNode = FocusNode()
      ..onKey = (checkboxFocusNode, rawkeyevent) {
        if (rawkeyevent.isKeyPressed(LogicalKeyboardKey.enter) ||
            rawkeyevent.isKeyPressed(LogicalKeyboardKey.numpadEnter) ||
            rawkeyevent.isKeyPressed(LogicalKeyboardKey.space)) {
          updateConfidential();
        } else {
          if (rawkeyevent.isKeyPressed(LogicalKeyboardKey.tab)) {
            if (rawkeyevent.isShiftPressed) {
              checkboxFocusNode.previousFocus();
            } else {
              checkboxFocusNode.nextFocus();
            }
          }
        }
        return KeyEventResult.handled;
      };
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    pseudoController.dispose();
    checkboxFocusNode.dispose();
  }

  String? validateLenBetween(String fieldValue, int minLen, int maxLen,
      String errorMessage, Function isValidValue) {
    if (!GetUtils.isLengthBetween(fieldValue, minLen, maxLen)) {
      isValidValue(false);
      updateFormValid();
      return errorMessage;
    } else {
      isValidValue(true);
      updateFormValid();
      return null;
    }
  }

  String? validatePseudo(String value) {
    return validateLenBetween(value, 3, 75,
        "Le pseudo doit faire entre 3 et 75 caractères.", isValidFieldPseudo);
  }

  String? validateFirstName(String value) {
    return validateLenBetween(
        value,
        3,
        30,
        "Le prénom doit faire entre 3 et 30 caractères.",
        isValidFieldFirstName);
  }

  String? validateLastName(String value) {
    return validateLenBetween(value, 3, 30,
        "Le nom doit faire entre 3 et 30 caractères.", isValidFieldLastName);
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      isValidFieldEmail(false);
      updateFormValid();
      return "L'email n'est pas valide.";
    } else {
      isValidFieldEmail(true);
      updateFormValid();
      return null;
    }
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool isValidPassword(String s) =>
      hasMatch(s, r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.{8,})');

  String? validatePassword(String value) {
    if (!isValidPassword(value)) {
      isValidFieldPassword(false);
      updateFormValid();
      return "Le mot de passe doit contenir à minima 8 caractères dont une majuscule, une minuscule et un chiffre.";
    } else {
      isValidFieldPassword(true);
      updateFormValid();
      return null;
    }
  }

  String? validateRepeatPassword(String value) {
    if (value != passwordController.text) {
      isValidFieldRepeatPassword(false);
      updateFormValid();
      return "Les mots de passe ne sont pas identiques.";
    } else {
      isValidFieldRepeatPassword(true);
      updateFormValid();
      return null;
    }
  }

  void updateShowPassword() {
    showPassword(!showPassword.value);
  }

  void updateConfidential() {
    isConfidentialChecked(!isConfidentialChecked.value);
    updateFormValid();
  }

  void updateFormValid() async {
    await Future.delayed(const Duration(microseconds: 1));
    isFormValid(isConfidentialChecked.value &&
        isValidFieldEmail.value &&
        isValidFieldFirstName.value &&
        isValidFieldLastName.value &&
        isValidFieldPassword.value &&
        // isValidFieldPseudo.value &&
        isValidFieldRepeatPassword.value);
  }

  Future<void> doRegister() async {
    isLoading(true);
  }
}
