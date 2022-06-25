part of register;

class RegisterFieldPassword extends StatelessWidget {
  const RegisterFieldPassword({required this.controller, Key? key})
      : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => FieldPassword(
          passwordController: controller.passwordController,
          showPasswordValue: controller.showPassword.value,
          updateShowPassword: controller.updateShowPassword,
          validatePassword: controller.validatePassword,
          label: "Votre mot de passe",
        ));
  }
}
