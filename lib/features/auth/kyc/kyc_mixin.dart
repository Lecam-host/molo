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
  double progress = 1.0;
  int currentPage = 0;
  PageController progressController = PageController(initialPage: 0);
  nextPage() async {
    if (currentPage < listPage.length - 1) {
      if (progressController.hasClients) {
        await progressController.animateToPage(currentPage + 1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut);
      }
    }
  }
  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void _listener(LoginState state) {}

  void _submit(LoginBloc loginBloc) {}
}
