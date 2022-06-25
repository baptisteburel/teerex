part of register;

class RegisterFieldRepeatPassword extends StatelessWidget {
  const RegisterFieldRepeatPassword({required this.controller, Key? key})
      : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => FieldPassword(
        passwordController: controller.repeatPasswordController,
        showPasswordValue: controller.showPassword.value,
        updateShowPassword: controller.updateShowPassword,
        validatePassword: controller.validateRepeatPassword,
        label: "Répétez votre mot de passe",
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (value) {
          if (controller.isFormValid.value) {
            controller.doRegister();
          }
        }));
  }
}
