import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:molo/core/constants/color_constants.dart';

import '../../../common/components/gradient_widget.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../core/utils/router/routes.dart';
import '../../../generated/locale_keys.g.dart';

class TellUsAboutAskPage extends StatefulWidget {
  const TellUsAboutAskPage({super.key});

  @override
  State<TellUsAboutAskPage> createState() => _TellUsAboutAskPageState();
}

class _TellUsAboutAskPageState extends State<TellUsAboutAskPage> {
  @override
  Widget build(BuildContext context) {
    return GradientWidget(
      child: Stack(
        children: [
          Positioned(
            top: 30,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          Center(
            child: Image.asset(
              height: MediaQuery.of(context).size.height * 0.4,
              "assets/images/image1.png",
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      LocaleKeys.tell_us_about_yourself.tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      LocaleKeys.signing_up_time.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //fontSize: 30,
                        color: ColorConstants.lightItem,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      LocaleKeys
                          .we_ll_store_any_info_you_give_us_securely_and_only_share_it_with_your_permission
                          .tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.lightItem,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ButtonWidget(
                      onPressed: () {
                        context.go(Routes.completeAccountInfoView.path);
                      },
                      label: LocaleKeys.continu.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ButtonWidget(
                      onPressed: () {},
                      label: LocaleKeys.skip.tr(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
