part of register;

class RegisterFieldEmail extends StatelessWidget {
  const RegisterFieldEmail({required this.controller, Key? key})
      : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return FieldCommon(
      valueController: controller.emailController,
      validateValue: controller.validateEmail,
      label: "Votre email",
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
    );
  }
}
