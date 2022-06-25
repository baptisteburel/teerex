part of register;

class RegisterButton extends StatelessWidget {
  const RegisterButton({required this.controller, Key? key}) : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SendFormButton(
        disableCondition: !controller.isFormValid.value,
        isLoading: controller.isLoading.value,
        onPressed: () async {
          await controller.doRegister();
        },
        label: "S'inscire"));
  }
}
