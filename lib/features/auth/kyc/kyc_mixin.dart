part of "complete_account_info_view.dart";

mixin KycMixin {
  List<Widget> get listPage => [
        const TellUsAboutYourself(),
        const TellUsAboutYourself(),
      ];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  double progress = 0.0;
  int currentPage = 0;
  PageController progressController = PageController(initialPage: 0);

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
