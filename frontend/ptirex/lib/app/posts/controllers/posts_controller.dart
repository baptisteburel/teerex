part of posts;

class PostsController extends GetxController {
  late AppSnackbar appSnackBar;
  final textValue = "".obs;
  final selectedComment = PostValue().obs;
  final postdata = "".obs;
  @override
  void onInit() {
    super.onInit();
    appSnackBar = AppSnackbar();
    fncthenice();
  }

  void fncthenice() async {
    var client = http.Client();

    final request = await client.get(
        Uri.parse("http://192.168.43.76:8080/api/v1/extended/forum-posts"));
    try {
      postdata(request.body);
      print(request.body);
    } catch (e) {}
  }
}
