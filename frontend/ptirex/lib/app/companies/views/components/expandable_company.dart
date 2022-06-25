part of companies;

class CompanyValue {
  String? name;
  String? description;
  String? num_tel;
  String? url_site;
  String? rating;
  String? email;

  CompanyValue({
    this.name,
    this.description,
    this.num_tel,
    this.url_site,
    this.rating,
    this.email,
  });
}

class ExpandableComment extends StatelessWidget {
  const ExpandableComment({required this.comment, Key? key}) : super(key: key);

  final CompanyValue comment;

  @override
  Widget build(BuildContext context) {
    final CompaniesController pc = Get.find();
    final MC mc = MC();
    return MouseRegion(
        onEnter: (value) {
          mc.h(true);
        },
        onExit: (value) {
          mc.h(false);
        },
        child: Material(
            type: MaterialType.transparency,
            child: Obx(() => ListTile(
                onTap: () {
                  pc.selectedComment(comment);
                },
                tileColor: mc.h.value ? Colors.grey.shade200 : null,
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(text: comment.name),
                      ),
                      RichText(
                        text: TextSpan(text: "${comment.rating}", children: [
                          WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow.shade800,
                              ),
                              alignment: PlaceholderAlignment.middle)
                        ]),
                      ),

                      //add comment photo if _commentController.isClicked.value
                    ]),
                leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/bg.jpg"))))));
  }
}

class DetailComment extends StatelessWidget {
  const DetailComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CompaniesController pc = Get.find();
    return Obx(
      () => pc.selectedComment.value.name?.isEmpty ?? true
          ? Center(
              child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Text("Pas d'entreprises sélectionnées.")),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: pc.selectedComment.value.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                              text: pc.selectedComment.value.rating,
                              style: Theme.of(context).textTheme.titleLarge,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade800,
                                    ),
                                    alignment: PlaceholderAlignment.middle),
                                TextSpan(text: "   ")
                              ]),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                            text:
                                "Description : \n${pc.selectedComment.value.description}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text:
                              "Contact : ${pc.selectedComment.value.num_tel} -  ${pc.selectedComment.value.email}",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Site de l'entreprise : ",
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: InkWell(
                                  onTap: () => launch(
                                      pc.selectedComment.value.url_site!),
                                  child:
                                      Text(pc.selectedComment.value.url_site!),
                                ),
                              )
                            ]),
                      ),

                      //add comment photo if _commentController.isClicked.value
                    ],
                  ),
                ]),
    );
  }
}

class MC extends GetxController {
  final h = false.obs;
}
