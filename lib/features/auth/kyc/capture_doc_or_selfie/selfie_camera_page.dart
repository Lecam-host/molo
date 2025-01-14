import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:molo/generated/locale_keys.g.dart';

import '../../../../common/components/camera/camera_card_page.dart';

class SelfiePicturePage extends StatefulWidget {
  const SelfiePicturePage({super.key, this.isFront = true});
  final bool isFront;
  @override
  State<SelfiePicturePage> createState() => _SelfiePicturePageState();
}

class _SelfiePicturePageState extends State<SelfiePicturePage> {
  // CompleteAccountInfoController completeAccountInfoController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CameraPage(
      format: OverlayFormat.oval,
      isSelfie: true,
      title: LocaleKeys.verify_identity.tr(),
      description: LocaleKeys.position_face_in_oval.tr(),
      onCapture: (value) {
        // completeAccountInfoController.selfiePicture.value = value.path;

        // Get.off(
        //   DisplayPictureScreen(
        //     format: OverlayFormat.oval,
        //     imagePath: value.path,
        //     onPressed: () async {
        //       Get.off(SuccessTakePicture());
        //     },
        //     s: 0,
        //     title: 'verify_identity'.tr,
        //     description: "position_face_in_oval".tr,
        //   ),
        // );
      },
    );
  }
}
