part of register;

class RegisterFieldPseudo extends StatelessWidget {
  const RegisterFieldPseudo({required this.controller, Key? key})
      : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return FieldCommon(
        valueController: controller.pseudoController,
        validateValue: controller.validatePseudo,
        label: "Votre pseudo");
  }
}
