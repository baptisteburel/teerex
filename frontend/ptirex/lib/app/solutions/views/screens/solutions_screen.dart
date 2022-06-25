part of solutions;

class SolutionsScreen extends GetView<SolutionsController> {
  const SolutionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationManager authManager = Get.find();
    final TextEditingController searchValue = TextEditingController();
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
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: InkWell(
                        child: Text(
                          "Accueil",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        onTap: () => Get.offNamed(Routes.home),
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color.fromARGB(255, 67, 181, 84),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          child: Text(
                            "Solutions",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          onTap: () => Get.offNamed(Routes.solutions),
                        ),
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
        SizedBox(
          height: 20,
        ),
        IntrinsicHeight(
            child: Row(children: [
          Flexible(
              flex: 3,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        flex: 9,
                        child: Material(
                          elevation: 10,
                          shadowColor: Colors.grey.shade400,
                          // color: Colors.transparent,
                          child: Theme(
                            data: ThemeData(),
                            child: Obx(
                              () => TextField(
                                onChanged: (value) =>
                                    controller.textValue(value),
                                textAlignVertical: TextAlignVertical.center,
                                controller: searchValue,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      const EdgeInsets.only(top: 10),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: "Recherche une solution...",
                                  prefixIcon: const Icon(
                                    Icons.search,
                                  ),
                                  suffixIcon: controller.textValue.value.isEmpty
                                      ? null
                                      : IconButton(
                                          onPressed: () => {
                                                searchValue.text = "",
                                                controller.textValue('')
                                              },
                                          icon: const Icon(Icons.close)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: TicketDataTableFilterButton(),
                      ),
                    ],
                  ),
                ),
                for (var comment in [
                  CompanyValue(
                      name: "Un titre",
                      description: "Une description",
                      rating: "5",
                      email: "baptiste.burel@insa-rouen.fr",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                  CompanyValue(
                      name: "Un autre titre",
                      email: "baptiste.burel@insa-rouen.fr",
                      description: "Une autre description",
                      rating: "5",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                  CompanyValue(
                      name: "Un titre différent ",
                      email: "baptiste.burel@insa-rouen.fr",
                      description: "Une description différente",
                      rating: "5",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                  CompanyValue(
                      name: "Un titre",
                      description: "Une description",
                      email: "baptiste.burel@insa-rouen.fr",
                      rating: "5",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                  CompanyValue(
                      name: "Un autre titre",
                      description: "Une autre description",
                      email: "baptiste.burel@insa-rouen.fr",
                      rating: "5",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                  CompanyValue(
                      name: "Un titre différent ",
                      email: "baptiste.burel@insa-rouen.fr",
                      description: "Une description différente",
                      rating: "5",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                  CompanyValue(
                      name: "Un titre",
                      email: "baptiste.burel@insa-rouen.fr",
                      description: "Une description",
                      rating: "5",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                  CompanyValue(
                      name: "Un autre titre",
                      description: "Une autre description",
                      email: "baptiste.burel@insa-rouen.fr",
                      rating: "5",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                  CompanyValue(
                      name: "Un titre différent ",
                      email: "baptiste.burel@insa-rouen.fr",
                      description: "Une description différente",
                      rating: "5",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                  CompanyValue(
                      name: "Un titre",
                      email: "baptiste.burel@insa-rouen.fr",
                      description: "Une description",
                      rating: "5",
                      num_tel: "0621825534",
                      url_site: "http://unsite.com"),
                ])
                  ExpandableComment(comment: comment),
              ])),
          VerticalDivider(
            color: Colors.black,
          ),
          Flexible(
              flex: 5,
              child: Container(
                child: DetailComment(),
              )),
        ])),
      ],
    )));
  }
}
