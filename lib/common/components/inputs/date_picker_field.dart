import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molo/core/utils/function_utiles.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/color_constants.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField(
      {super.key, required this.controller, this.label = "Date"});
  final TextEditingController controller;
  final String label;
  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime selectedDate = DateTime.now();
  String dateShow = "";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      dateShow = await FunctionUtils.convertDate(picked, "fr_FR");
      setState(() {
        dateShow;
        selectedDate = picked;
        widget.controller.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.withBrightness(
            color: ColorConstants.lightTextField,
            darkColor: ColorConstants.darkTextField,
          ),
          border: Border.all(
            color: CupertinoDynamicColor.withBrightness(
              color: ColorConstants.lightBackgroundColorActivated,
              darkColor: ColorConstants.darkBackgroundColorActivated,
            ),
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(
              Radius.circular(AppConstants.borderRadius)),
        ),
        child: Row(
          children: [
            if (dateShow.isEmpty)
              Text(
                widget.label,
                style: TextStyle(
                  color: CupertinoDynamicColor.withBrightness(
                    color: ColorConstants.darkSecondaryIcon,
                    darkColor: ColorConstants.lightSecondaryIcon,
                  ),
                ),
              ),
            if (dateShow.isNotEmpty)
              Text(
                dateShow,
                style: const TextStyle(
                  color: CupertinoDynamicColor.withBrightness(
                    color: CupertinoColors.black,
                    darkColor: CupertinoColors.white,
                  ),
                ),
              ),
            const Spacer(flex: 1),
            Icon(
              CupertinoIcons.calendar,
              color: CupertinoDynamicColor.withBrightness(
                color: ColorConstants.darkSecondaryIcon,
                darkColor: ColorConstants.lightSecondaryIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
