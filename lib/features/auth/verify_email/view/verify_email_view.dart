library verify_email_view;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:molo/core/utils/router/routes.dart';
import 'package:molo/features/auth/register/bloc/register_bloc.dart';
import 'package:molo/features/auth/register/bloc/register_state.dart';
import 'package:molo/features/theme/bloc/theme_bloc.dart';
import 'package:molo/features/theme/bloc/theme_state.dart';
import 'package:molo/generated/locale_keys.g.dart';

import '../../../../common/components/inputs/custom_text_field.dart';
import '../../../../common/helpers/app_helper.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../../../core/models/http_response_model.dart';
import '../../../profile/bloc/profile_bloc.dart';
import '../../../profile/bloc/profile_event.dart';
import '../../components/auth_header.dart';
import '../../register/bloc/register_event.dart';
part "verify_email_view_mixin.dart";

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView>
    with VerifyEmailViewMixin {
  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, registerState) {
            return BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                _listener(state);
              },
              child: Scaffold(
                body: SafeArea(
                  child: PopScope(
                    canPop: !registerState.isLoading,
                    child: Column(
                      children: [
                        AuthHeaderWidget(
                          title: LocaleKeys.enter_your_email.tr(),
                          subtitle: LocaleKeys.enter_your_email_to_confirm.tr(),
                        ),
                        // Text(
                        //   LocaleKeys.enter_verification_code_prefix.tr(),
                        //   style: TextStyle(
                        //     color: themeState.isDark
                        //         ? ColorConstants.lightTextField
                        //         : ColorConstants.darkTextField,
                        //   ),
                        // ).tr(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              CustomTextField(
                                textEditingController:
                                    _emailTextEditingController,
                                // enabled: !state.isLoading,
                                placeholder: LocaleKeys.email.tr(),
                                prefixIcon: CupertinoIcons.mail,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ButtonWidget(
                                isLoading: registerState.isLoading,
                                label: LocaleKeys.verify_your_email.tr(),
                                onPressed: () {
                                  _submit(registerBloc);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
