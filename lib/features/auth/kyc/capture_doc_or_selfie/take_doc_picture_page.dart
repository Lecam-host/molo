import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:molo/generated/locale_keys.g.dart';

import '../../../../common/components/camera/camera_card_page.dart';
import 'take_selfie_page.dart';

class TakeDocPicturePage extends StatefulWidget {
  const TakeDocPicturePage({super.key, this.isFront = true});
  final bool isFront;
  @override
  State<TakeDocPicturePage> createState() => _TakeDocPicturePageState();
}

class _TakeDocPicturePageState extends State<TakeDocPicturePage> {
  // CompleteAccountInfoController completeAccountInfoController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CameraPage(
      format: OverlayFormat.cardID1,
      title: LocaleKeys.verify_identity.tr(),
      description: LocaleKeys.position_face_in_oval.tr(),
      descriptionPicture: widget.isFront
          ? LocaleKeys.front_of_card.tr()
          : LocaleKeys.back_card.tr(),
      onCapture: (value) {
        // if (widget.isFront == true) {
        //   completeAccountInfoController.docRectoPicture.value = value.path;
        // } else {
        //   completeAccountInfoController.docVersoPicture.value = value.path;
        // }

        // Get.off(
        //   DisplayPictureScreen(
        //     format: OverlayFormat.cardID1,
        //     imagePath: value.path,
        //     onPressed: () async {
        //       if (widget.isFront == true) {
        //         Get.to(const TakeDocPicturePage(
        //           isFront: false,
        //         ));
        //       } else {
        //         Get.off(const TakeSelfiePage());
        //         // Get.to(LoaderCirclePage(
        //         //   message: "${"uploading".tr}...",
        //         // ))!
        //         //     .then((value) {
        //         //   Future.delayed(const Duration(seconds: 3), () {
        //         //     print("-d--d--d--dd-d-d-dd-d--d");

        //         //   });
        //         // });
        //       }
        //     },
        //     s: 0,
        //     descriptionPicture:
        //         widget.isFront ? "front_of_card".tr : "back_card".tr,
        //     title: 'verify_identity'.tr,
        //     description: "position_all_4_corners".tr,
        //   ),
        // );
      },
    );
  }
}
