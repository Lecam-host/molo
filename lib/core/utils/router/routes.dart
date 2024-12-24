enum Routes {
  initial('/'),
  navigation('/navigation'),
  login('/login'),
  onBoarding('/onBoarding'),
  register('/register'),
  verify('/verify'),
  verifyEmailView('/verifyEmailView'),

  profile('/profile'),
  settings('/settings'),
  update_password('/update_password'),
  ;

  final String path;
  const Routes(this.path);
}
