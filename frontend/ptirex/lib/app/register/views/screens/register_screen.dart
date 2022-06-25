part of register;

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(ImagesPath.bg),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Color(0xFF8FDC9B),
        body: SafeArea(
          child: Center(
            child: FractionallySizedBox(
              widthFactor:
                  MediaQuery.of(context).size.width < 1400 ? 0.5 : 0.35,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: _formulaire(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formulaire(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 30,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CardTitle("Inscription"),
              RegisterFieldFirstName(
                controller: controller,
              ),
              const SizedBox(height: 15),
              RegisterFieldLastName(
                controller: controller,
              ),
              const SizedBox(height: 15),
              RegisterFieldEmail(
                controller: controller,
              ),
              const SizedBox(height: 15),
              RegisterFieldPassword(controller: controller),
              const SizedBox(height: 15),
              RegisterFieldRepeatPassword(controller: controller),
              const SizedBox(height: 15),
              CheckboxConfidential(
                controller: controller,
              ),
              const SizedBox(height: 15),
              CheckboxChercheurPartageur(
                controller: controller,
              ),
              const SizedBox(height: 15),
              RegisterButton(
                controller: controller,
              ),
              const SizedBox(height: 15),
              TextInscrire(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
