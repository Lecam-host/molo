import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:molo/features/auth/kyc/complete_account_info_view.dart';
import 'package:molo/generated/locale_keys.g.dart';

import '../../../common/components/inputs/custom_text_field.dart';
import '../../../common/components/inputs/date_picker_field.dart';
import '../../../common/components/text_widget.dart';

class TellUsAboutYourself extends StatefulWidget {
  const TellUsAboutYourself({super.key});

  @override
  State<TellUsAboutYourself> createState() => _TellUsAboutYourselfState();
}

class _TellUsAboutYourselfState extends State<TellUsAboutYourself>
    with KycMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Form(
        key: tellUsAboutYourselfKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextWidget(
              text: LocaleKeys.tell_us_about_yourself.tr(),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              textEditingController: firstNameController,
              placeholder: LocaleKeys.first_name.tr(),
              textInputAction: TextInputAction.done,
              //enabled: !state.isLoading,

              onSubmitted: (value) {
                // _submit(loginBloc);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              textEditingController: lastNameController,
              placeholder: LocaleKeys.last_name.tr(),
              textInputAction: TextInputAction.done,
              //enabled: !state.isLoading,
              onSubmitted: (value) {
                // _submit(loginBloc);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DatePickerField(
              controller: birthdayController,
              label: LocaleKeys.date_of_birth.tr(),
            )
          ],
        ),
      ),
    );
  }
}
