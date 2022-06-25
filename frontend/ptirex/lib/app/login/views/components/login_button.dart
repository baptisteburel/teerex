part of login;

class LoginButton extends StatelessWidget {
  const LoginButton({required this.controller, Key? key}) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SendFormButton(
        disableCondition: !controller.isFormValid.value,
        isLoading: controller.isLoading.value,
        onPressed: () async {
          await controller.doLogin();
        },
        label: "Connexion"));
  }
}
