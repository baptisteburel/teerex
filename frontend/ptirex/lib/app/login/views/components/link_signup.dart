part of login;

class LinkSignup extends StatelessWidget {
  const LinkSignup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Pas de compte ? ",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextSpan(
            text: "S'inscrire",
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.offNamed(Routes.register),
            style: Theme.of(context).textTheme.titleSmall?.merge(TextStyle(
                  color: Colors.green.shade600,
                )),
          )
        ]),
      ),
    );
  }
}
