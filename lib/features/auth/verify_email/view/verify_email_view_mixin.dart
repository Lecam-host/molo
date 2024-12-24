part of "verify_email_view.dart";

mixin VerifyEmailViewMixin on State<VerifyEmailView> {
  late TextEditingController _emailTextEditingController;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
  }

  void _submit(RegisterBloc registerBloc) {
    HttpResponseModel httpResponseModel = AppHelper.checkEmail(
      email: _emailTextEditingController.text.trim(),
    );
    if (httpResponseModel.statusCode == 200) {
      registerBloc.add(
        CheckEmailButtonPressed(
          email: _emailTextEditingController.text.trim(),
        ),
      );
    } else {
      AppHelper.showErrorMessage(
          context: context, content: httpResponseModel.message);
    }
  }

  void _listener(RegisterState state) {
    final ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);
    if (state is RegisterSuccess) {
      profileBloc.add(SetUser(user: state.user));
      context.go(Routes.initial.path);
    } else if (state is RegisterFailed) {
      AppHelper.showErrorMessage(
          context: context, content: LocaleKeys.something_went_wrong.tr());
    }
  }
}
