part of posts;

class PostValue {
  String? id;
  String? title;
  String? description;
  dynamic? company;
  dynamic? tag;

  PostValue({
    comment,
    this.title,
    this.description,
    this.company,
    this.tag,
  });
}

class ExpandableComment extends StatelessWidget {
  const ExpandableComment({required this.comment, Key? key}) : super(key: key);

  final PostValue comment;

  @override
  Widget build(BuildContext context) {
    final PostsController pc = Get.find();
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
                        text: TextSpan(text: comment.title),
                      ),
                      RichText(
                        text: TextSpan(text: "Créé par ${comment.company}"),
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
    final PostsController pc = Get.find();
    return Obx(
      () => pc.selectedComment.value.title?.isEmpty ?? true
          ? Center(
              child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Text("Pas de commentaire sélectionné.")),
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
                            text: pc.selectedComment.value.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                              text: "5",
                              style: Theme.of(context).textTheme.titleLarge,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade800,
                                    ),
                                    alignment: PlaceholderAlignment.middle)
                              ]),
                        ),
                      ),

                      Obx(
                        () => RichText(
                          text: TextSpan(text: "Tags: ", children: [
                            for (var title in pc.selectedComment.value.tag!)
                              WidgetSpan(
                                  child: TagCard(title: title),
                                  alignment: PlaceholderAlignment.middle)
                          ]),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text:
                                "Créé par ${pc.selectedComment.value.company}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                            text:
                                "Description : \n${pc.selectedComment.value.description}"),
                      ),

                      //add comment photo if _commentController.isClicked.value
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ElevatedButton.icon(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      icon: const Icon(Icons.add),
                      label: const Text("Ajouter un commentaire"),
                    ),
                  )
                ]),
    );
  }
}

class MC extends GetxController {
  final h = false.obs;
}
