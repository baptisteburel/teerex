part of register;

class TextInscrire extends StatelessWidget {
  const TextInscrire({required this.controller, Key? key}) : super(key: key);
  final RegisterController controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Vous avez déjà un compte ? ",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextSpan(
              text: "Connectez vous",
              style:
                  Theme.of(context).textTheme.titleSmall?.merge(const TextStyle(
                        color: Color(0xFF8FDC9B),
                      )),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.offNamed(Routes.home))
        ]),
      ),
    );
  }
}
