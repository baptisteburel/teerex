part of login;

class LinkForgotPassword extends StatelessWidget {
  const LinkForgotPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
          text: TextSpan(
        style: Theme.of(context).textTheme.titleSmall,
        text: "Mot de passe oublié",
      )),
    );
  }
}
