import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:molo/generated/locale_keys.g.dart';

import '../../../../common/components/text_widget.dart';
import '../../../../common/widgets/button_widget.dart';
import 'selfie_camera_page.dart';

class TakeSelfiePage extends StatefulWidget {
  const TakeSelfiePage({super.key});

  @override
  State<TakeSelfiePage> createState() => _TakeSelfiePageState();
}

class _TakeSelfiePageState extends State<TakeSelfiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.selfie_verification.tr()),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextWidget(text: LocaleKeys.take_selfie.tr()),
            const SizedBox(
              height: 10,
            ),
            DescriptionTextWidget(text: LocaleKeys.why_take_selfie.tr()),
            const SizedBox(
              height: 10,
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       Image.asset(
            //         AppImages.selfie2,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Image.asset(
            //         AppImages.selfie3,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Image.asset(
            //         AppImages.selfie5,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Image.asset(
            //         AppImages.selfie5,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Image.asset(
            //         AppImages.selfie6,
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Image.asset(
            //         AppImages.selfie5,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Image.asset(
            //         AppImages.selfie6,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Image.asset(
            //         AppImages.selfie2,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Image.asset(
            //         AppImages.selfie5,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Image.asset(
            //         AppImages.selfie3,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //     ],
            //   ),
            // ),
            const Spacer(),
            // Container(
            //   // width: double.infinity,
            //   height: 100,
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: AppColors.neutral200Color,
            //       borderRadius: BorderRadius.circular(10)),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset(AppIcons.cadenaLock),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       Expanded(
            //         child: Text(
            //           "data_encrypted_message".tr,
            //           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //               fontWeight: FontWeight.w600,
            //               color: AppColors.greyColor),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              //labelText: "continue".tr,
              label: LocaleKeys.continu.tr(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SelfiePicturePage(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
