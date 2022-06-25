part of register;

class CheckboxChercheurPartageur extends StatelessWidget {
  const CheckboxChercheurPartageur({required this.controller, Key? key})
      : super(key: key);

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RichText(
        text: TextSpan(children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Obx(() => Checkbox(
                  focusNode: controller.checkboxFocusNode,
                  value: controller.checkPart.value,
                  onChanged: (value) =>
                      {controller.checkPart(!controller.checkPart.value)},
                )),
          ),
          TextSpan(
            text: "Je souhaite participer en tant que partageur de solution.",
            recognizer: TapGestureRecognizer()
              ..onTap = () => controller.checkPart(!controller.checkPart.value),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ]),
      ),
      RichText(
        text: TextSpan(children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Obx(() => Checkbox(
                  focusNode: controller.checkboxFocusNode,
                  value: controller.checkCher.value,
                  onChanged: (value) =>
                      {controller.checkCher(!controller.checkCher.value)},
                )),
          ),
          TextSpan(
            text: "Je souhaite participer en tant que chercheur de solution.",
            recognizer: TapGestureRecognizer()
              ..onTap = () => controller.checkCher(!controller.checkCher.value),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ]),
      ),
    ]);
  }
}
