part of register;

class RegisterFieldLastName extends StatelessWidget {
  const RegisterFieldLastName({required this.controller, Key? key})
      : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return FieldCommon(
        valueController: controller.lastNameController,
        validateValue: controller.validateLastName,
        label: "Votre nom");
  }
}
