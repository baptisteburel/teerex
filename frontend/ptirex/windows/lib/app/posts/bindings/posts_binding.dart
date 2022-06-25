part of posts;

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostsController());
  }
}
