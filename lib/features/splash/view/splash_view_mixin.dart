// ignore_for_file: use_build_context_synchronously

part of "splash_view.dart";

mixin SplashViewMixin on State<SplashView> {
  final UserService _userService = UserService(di(), di());

  Future<bool> _future(BuildContext context) async {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    String? authToken = await _userService.getAuthTokenFromSP();

    if (authToken == null) {
      loginBloc.add(const LogoutButtonPressed());
      if (context.mounted) {
        // context.go(Routes.login.path); // Open this comment line
      }
    } else {
      loginBloc.add(ValidateAuthToken(authToken: authToken));
    }

    // TODO: When you create the user authentication service, delete the code block below that directs to the NavigationView page and open the comment lines above.
    // Remove this Future.delayed() function. This was added for testing purposes to direct you to the home page instead of the direct login screen when you first launch the project.
    Future.delayed(Duration.zero, () async {
      AppStorage appStorage = AppStorage(sharedPreferences: di());
      AppModel? appModel = await appStorage.loadData();
      if (context.mounted) {
        if (appModel != null && appModel.alreadySeeOnboarding) {
          AuthLocalDataSourceImpl authLocalDataSourceImpl =
              AuthLocalDataSourceImpl(sharedPreferences: di());
          await authLocalDataSourceImpl.loadData().then((user) {
            if (user != null) {
              _checkValues(user)
                  ? context.go(Routes.navigation.path)
                  : context.go(Routes.login.path);
            } else {
              context.go(Routes.login.path);
            }
          });
        } else {
          context.go(Routes.onBoarding.path);
        }
      }
    });

    return true;
  }

  bool _checkValues(UserModel userModel) {
    // if (userModel.firstName.isEmpty) return false;
    if (userModel.email.isEmpty) return false;
    //if (userModel.lastName.isEmpty) return false;
    // if (userModel.dateOfBirth.toUtc() == AppConstants.nullDate) return false;
    // if (userModel.gender == 0) return false;
    return true;
  }

  void _listener(LoginState state,
      {required LoginBloc loginBloc,
      required RegisterBloc registerBloc,
      required ProfileBloc profileBloc}) {
    if (state is ValidateSuccess) {
      profileBloc.add(SetUser(user: state.user));
      registerBloc.add(const ClearRegisterData());
      context.go(Routes.login.path);
      _checkValues(state.user)
          ? context.go(Routes.navigation.path)
          : context.go(Routes.profile.path);
    } else if (state is ValidateFailed) {
      loginBloc.add(const LogoutButtonPressed());
      registerBloc.add(const ClearRegisterData());
      context.go(Routes.onBoarding.path);
      AppHelper.showErrorMessage(
          context: context, content: LocaleKeys.session_terminated.tr());
    }
  }
}
