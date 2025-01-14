import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/color_constants.dart';
import '../../features/theme/bloc/theme_bloc.dart';
import '../../features/theme/bloc/theme_state.dart';

class CountrySelectInpunt extends StatefulWidget {
  const CountrySelectInpunt({
    super.key,
    required this.onSelect,
    this.label,
  });
  final Function(CountryCode) onSelect;
  final String? label;
  @override
  State<CountrySelectInpunt> createState() => _CountrySelectInpuntState();
}

class _CountrySelectInpuntState extends State<CountrySelectInpunt> {
  CountryCode? countrySelected;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return CountryCodePicker(
        onChanged: (CountryCode country) {
          inspect(country);
          widget.onSelect(country);
          setState(() {
            countrySelected = country;
          });
        },
        showFlagMain: true,
        showFlag: true,
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        initialSelection: "CI",
        onInit: (CountryCode? country) => countrySelected = country,
        builder: (CountryCode? country) => Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(
            //   color: themeState.isDark
            //       ? ColorConstants.darkPrimaryIcon
            //       : ColorConstants.lightPrimaryIcon,
            // ),
            color: CupertinoDynamicColor.withBrightness(
              color: ColorConstants.lightTextField,
              darkColor: ColorConstants.darkTextField,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                country!.flagUri!,
                package: 'country_code_picker',
                width: 32,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(country.name ?? ""),
              const Spacer(),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        countryFilter: const ['IT', 'FR', "CI"],
      );
    });
  }
}
