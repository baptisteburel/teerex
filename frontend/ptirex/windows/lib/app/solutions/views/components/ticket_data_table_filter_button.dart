part of solutions;

class TicketDataTableFilterButton extends GetView<SolutionsController> {
  const TicketDataTableFilterButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.topEnd, children: [
      IconButton(
        onPressed: () => {
          controller.showFilterTicketModal(
            context: context,
          )
        },
        icon: const Icon(
          Icons.filter_alt,
          color: Color(0xFF8FDC9B),
        ),
        tooltip: "Filtrer",
      ),
      Obx(() => controller.filterCount.value > 0
          ? TagCard(
              title: controller.filterCount.value.toString(),
              color: Color.fromARGB(255, 67, 181, 84),
              size: 10,
            )
          : const SizedBox()),
    ]);
  }
}
