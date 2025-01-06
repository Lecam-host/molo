import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:molo/generated/locale_keys.g.dart';

import '../../../../common/widgets/button_widget.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/utils/router/routes.dart';
import '../../../theme/bloc/theme_bloc.dart';
import '../../../theme/bloc/theme_state.dart';

class GoKycPageButton extends StatelessWidget {
  const GoKycPageButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return GestureDetector(
          // onTap: onPressed,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: themeState.isDark
                  ? ColorConstants.darkBackgroundColorContainer
                  : ColorConstants.darkBackground,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: themeState.isDark
                      ? ColorConstants.darkBackground
                      : ColorConstants.lightBackground,
                  child: Icon(
                    Icons.edit,
                    color: themeState.isDark
                        ? ColorConstants.lightItem
                        : ColorConstants.darkItem,
                  ),
                ),
                Text(
                  LocaleKeys.tell_us_about_yourself.tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.lightBackground,
                      fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  LocaleKeys.tell_us_about_yourself.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorConstants.lightBackground,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 250,
                  child: ButtonWidget(
                    label: LocaleKeys.start.tr(),
                    onPressed: () {
                      context.push(Routes.tell_us_about_ask.path);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
