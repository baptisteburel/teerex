part of solutions;

class SolutionsController extends GetxController {
  late AppSnackbar appSnackBar;
  final textValue = "".obs;
  final selectedComment = CompanyValue().obs;
  final filterCount = 0.obs;

  final statusFilterValues = ["EMISSION", "ENERGIE", "RECYCLAGE"];
  final statusFilterSelected = <String>[].obs;
  final statusFilterSelectedSaved = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    appSnackBar = AppSnackbar();
  }

  void initFilters() {
    statusFilterSelected(List.from(statusFilterSelectedSaved.asMap().values));
    saveFilters();
  }

  void saveFilters() {
    statusFilterSelectedSaved(List.from(statusFilterSelected.asMap().values));
    filterCount(statusFilterSelectedSaved.length);
  }

  void updateStatusFilterSelected(
      {required bool add, required String statusValue}) {
    if (add) {
      statusFilterSelected.add(statusValue);
    } else {
      statusFilterSelected.remove(statusValue);
    }
  }

  Future<void> showFilterTicketModal({required BuildContext context}) async {
    initFilters();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      child: Text(
                        "Filtrer par",
                      ),
                      alignment: Alignment.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Tags : "),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                    children: [
                      for (var statusValue in statusFilterValues)
                        WidgetSpan(
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Obx(() => FilterChip(
                                      selectedColor: Color(0xFF8FDC9B),
                                      label: Text(statusValue),
                                      onSelected: (add) => {
                                        updateStatusFilterSelected(
                                            add: add, statusValue: statusValue)
                                      },
                                      selected: statusFilterSelected
                                          .contains(statusValue),
                                    ))))
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("ANNULER")),
          TextButton(
            onPressed: () {
              saveFilters();
              Navigator.pop(context);
            },
            child: const Text(
              "MODIFIER",
            ),
          ),
        ],
      ),
    );
  }
}
