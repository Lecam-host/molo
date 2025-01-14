import 'package:flutter/material.dart';

import '../../../../common/components/gradient_widget.dart';
import '../../../../common/widgets/button_widget.dart';

class SuccessTakePicture extends StatefulWidget {
  const SuccessTakePicture({super.key});

  @override
  State<SuccessTakePicture> createState() => _SuccessTakePictureState();
}

class _SuccessTakePictureState extends State<SuccessTakePicture> {
  @override
  Widget build(BuildContext context) {
    return GradientWidget(
      child: Stack(
        children: [
          Positioned(
            top: 30,
            child: IconButton(
                onPressed: () {
                  // Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Verification",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              Center(
                child: Image.asset(
                  "assets/images/image1.png",
                  height: 150,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 400,
                    child: ButtonWidget(
                      onPressed: () async {
                        // XFileCallback? onCapture;
                        // OverlayFormat? format;
                        // bool isSelfie;
                      },
                      label: 'Continue',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
