part of solutions;

class SolutionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SolutionsController());
  }
}
