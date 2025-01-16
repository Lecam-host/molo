part of "complete_account_info_view.dart";

mixin KycMixin {
  List<Widget> get listPage => [
        const TellUsAboutYourself(),
        const SelectCountryAndCity(),
        const TakeSelfiePage(),
        //  TakePictureScreen(camera: ,)
      ];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  GlobalKey<FormState> tellUsAboutYourselfKey = GlobalKey<FormState>();
  double progress = 1.0;
  int currentPage = 0;
  PageController progressController = PageController(initialPage: 0);

  nextPage(BuildContext context) async {
    if (currentPage < listPage.length - 1) {
      if (currentPage == 0 &&
          (firstNameController.text.isEmpty ||
              lastNameController.text.isEmpty ||
              birthdayController.text.isEmpty)) {
        AppHelper.showErrorMessage(
            context: context, content: "Please fill all the fields");
        return;
      }
      if (progressController.hasClients) {
        await progressController.animateToPage(currentPage + 1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut);
      }
    }
  }
}
