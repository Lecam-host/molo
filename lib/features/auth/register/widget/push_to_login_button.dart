import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:molo/core/utils/router/routes.dart';
import 'package:molo/features/theme/bloc/theme_bloc.dart';
import 'package:molo/features/theme/bloc/theme_state.dart';
import 'package:molo/core/constants/color_constants.dart';
import 'package:molo/generated/locale_keys.g.dart';

class PushToLoginButton extends StatelessWidget {
  const PushToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            context.go(Routes.login.path);
          },
          child: Text(
            LocaleKeys.login,
            style: TextStyle(
              color: themeState.isDark
                  ? ColorConstants.darkPrimaryIcon
                  : ColorConstants.lightPrimaryIcon,
            ),
          ).tr(),
        );
      },
    );
  }
}
