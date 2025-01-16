import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:molo/features/auth/kyc/complete_account_info_view.dart';
import 'package:molo/generated/locale_keys.g.dart';

import '../../../common/components/inputs/custom_text_field.dart';
import '../../../common/components/select_country_widget.dart';
import '../../../common/components/text_widget.dart';

class SelectCountryAndCity extends StatefulWidget {
  const SelectCountryAndCity({super.key});

  @override
  State<SelectCountryAndCity> createState() => _SelectCountryAndCityState();
}

class _SelectCountryAndCityState extends State<SelectCountryAndCity>
    with KycMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextWidget(
            text: LocaleKeys.residence_place.tr(),
          ),
          const SizedBox(
            height: 20,
          ),
          CountrySelectInpunt(
            onSelect: (p0) {},
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            textEditingController: lastNameController,
            placeholder: LocaleKeys.city.tr(),
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
            placeholder: LocaleKeys.address.tr(),
            textInputAction: TextInputAction.done,
            //enabled: !state.isLoading,
            onSubmitted: (value) {
              // _submit(loginBloc);
            },
          ),
        ],
      ),
    );
  }
}
