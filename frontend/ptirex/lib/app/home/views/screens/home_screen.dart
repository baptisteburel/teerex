part of home;

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationManager authManager = Get.find();
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Color(0xFF8FDC9B),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color.fromARGB(255, 67, 181, 84),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          child: Text(
                            "Accueil",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          onTap: () => Get.offNamed(Routes.home),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: InkWell(
                        child: Text(
                          "Retour d'expérience",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        onTap: () => Get.offNamed(Routes.posts),
                      ),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: InkWell(
                        child: Text(
                          "Entreprises",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        onTap: () => Get.offNamed(Routes.companies),
                      ),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: InkWell(
                        child: Text(
                          "Solutions",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        onTap: () => Get.offNamed(Routes.solutions),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, right: 10),
                  child: Obx(
                    () => authManager.isLogged.value
                        ? InkWell(
                            child: Text(
                              "Se déconnecter",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            onTap: () {
                              controller.appSnackBar.showSnackBar(context,
                                  "Vous vous êtes déconnecté avec succès.");
                              authManager.logOutUser();
                            })
                        : InkWell(
                            child: Text(
                              "Se connecter",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            onTap: () => Get.offNamed(Routes.login),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Image(image: AssetImage("assets/images/teerex.png")),
        )
      ],
    )));
  }
}
