part of companies;

class CompaniesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompaniesController());
  }
}
