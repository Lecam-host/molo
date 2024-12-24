import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molo/features/theme/bloc/theme_bloc.dart';
import 'package:molo/features/theme/bloc/theme_state.dart';
import 'package:molo/core/constants/color_constants.dart';
import 'package:molo/common/helpers/ui_helper.dart';

import '../../../../core/constants/app_constants.dart';

class ButtonWidget extends StatelessWidget {
  final bool isLoading;
  final String label;
  final void Function()? onPressed;
  const ButtonWidget(
      {super.key,
      this.isLoading = false,
      required this.onPressed,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return SizedBox(
          width: UIHelper.deviceWidth,
          child: CupertinoButton(
            color: themeState.isDark
                ? ColorConstants.darkPrimaryIcon
                : ColorConstants.lightPrimaryIcon,
            onPressed: isLoading ? null : onPressed,
            borderRadius: const BorderRadius.all(
                Radius.circular(AppConstants.borderRadius)),
            padding: const EdgeInsets.all(10),
            disabledColor: themeState.isDark
                ? ColorConstants.darkPrimaryIcon
                : ColorConstants.lightPrimaryIcon,
            pressedOpacity: 0.5,
            child: isLoading
                ? const CupertinoActivityIndicator(
                    color: CupertinoColors.white,
                  )
                : Text(label,
                    style: TextStyle(
                      color: !themeState.isDark
                          ? ColorConstants.lightBackground
                          : ColorConstants.darkSecondaryIcon,
                    )).tr(),
          ),
        );
      },
    );
  }
}
