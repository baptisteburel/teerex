part of login;

class LoginFieldEmail extends StatelessWidget {
  const LoginFieldEmail({required this.controller, Key? key}) : super(key: key);

  final LoginController controller;

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
