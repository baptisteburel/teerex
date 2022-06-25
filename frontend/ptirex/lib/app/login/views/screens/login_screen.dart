part of login;

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(ImagesPath.bg),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Color(0xFF8FDC9B),
        body: SafeArea(
            // child: ResponsiveBuilder(
            //   mobileBuilder: (context, constraints) {
            child: Center(
          child: FractionallySizedBox(
            widthFactor: MediaQuery.of(context).size.width < 1400 ? 0.5 : 0.35,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _formulaire(context),
            ),
          ),
        )
            //   },
            //   tabletBuilder: (context, constraints) {
            //     return Center(
            //       child: FractionallySizedBox(
            //         widthFactor: 0.6,
            //         child: SingleChildScrollView(
            //             padding: const EdgeInsets.all(10),
            //             child: _formulaire(context)),
            //       ),
            //     );
            //   },
            //   desktopBuilder: (context, constraints) {
            //     return Center(
            //       child: FractionallySizedBox(
            //         widthFactor: constraints.maxWidth > 1400 ? 0.35 : 0.5,
            //         child: SingleChildScrollView(
            //           padding: const EdgeInsets.all(10),
            //           child: _formulaire(context),
            //         ),
            //       ),
            //     );
            //   },
            // ),
            ),
      ),
    );
  }

  Widget _formulaire(context) {
    return Card(
      color: Colors.grey.shade100,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CardTitle("Bienvenue !"),
            const SizedBox(
              height: 30,
            ),
            Form(
              child: Column(
                children: <Widget>[
                  LoginFieldEmail(controller: controller),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginFieldPassword(controller: controller),
                  const SizedBox(
                    height: 20,
                  ),
                  const LinkForgotPassword(),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginButton(controller: controller),
                  const SizedBox(
                    height: 20,
                  ),
                  const LinkSignup(),
                  const SizedBox(
                    height: 40,
                  ),
                  const DevelopedByS3EB(color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
