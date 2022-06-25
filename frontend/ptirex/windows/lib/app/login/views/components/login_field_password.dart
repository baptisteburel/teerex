part of login;

class LoginFieldPassword extends StatelessWidget {
  const LoginFieldPassword({required this.controller, Key? key})
      : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => FieldPassword(
          passwordController: controller.passwordController,
          showPasswordValue: controller.showPassword.value,
          updateShowPassword: controller.updateShowPassword,
          validatePassword: controller.validatePassword,
          label: "Votre mot de passe",
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (value) {
            if (controller.isFormValid.value) {
              controller.doLogin();
            }
          },
        ));
  }
}
