part of register;

class RegisterFieldFirstName extends StatelessWidget {
  const RegisterFieldFirstName({required this.controller, Key? key})
      : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return FieldCommon(
        valueController: controller.firstNameController,
        validateValue: controller.validateFirstName,
        label: "Votre prénom");
  }
}
