import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../common/helpers/app_helper.dart';
import '../../../common/helpers/size_config.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/utils/router/routes.dart';
import '../../../generated/locale_keys.g.dart';
import '../../theme/bloc/theme_bloc.dart';
import '../../theme/bloc/theme_state.dart';
import 'capture_doc_or_selfie/take_selfie_page.dart';
import 'select_country_and_city.dart';
import 'tell_us_about_yourself_page.dart';
part "kyc_mixin.dart";

class CompleteAccountInfoView extends StatefulWidget {
  const CompleteAccountInfoView({super.key});

  @override
  State<CompleteAccountInfoView> createState() =>
      _CompleteAccountInfoViewState();
}

class _CompleteAccountInfoViewState extends State<CompleteAccountInfoView>
    with KycMixin {
  @override
  void initState() {
    progress = 1 / listPage.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double width = SizeConfig.screenW!;
    // double height = SizeConfig.screenH!;
    return Scaffold(
      body: SafeArea(child:
          BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
        SizeConfig().init(context);
        double width = SizeConfig.screenW!;
        // double height = SizeConfig.screenH!;
        return Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.go(Routes.navigation.path);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    )),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                    child: SizedBox(
                  width: 60,
                  child: LinearProgressIndicator(
                      minHeight: 5.0,
                      value: progress,
                      color: ColorConstants.darkBackgroundColorContainer,
                      backgroundColor:
                          ColorConstants.lightBackgroundColorActivated,
                      borderRadius: BorderRadius.circular(10)),
                )),
                const SizedBox(
                  width: 70,
                )
              ],
            ),
            Expanded(
              child: PageView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: progressController,
                //physics: NeverScrollableScrollPhysics(),
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                    progress = (page + 1) / listPage.length;
                  });
                },
                children: listPage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (currentPage == 0) {
                        context.go(Routes.navigation.path);
                      }
                    },
                    style: TextButton.styleFrom(
                      elevation: 0,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: (width <= 550) ? 13 : 17,
                      ),
                    ),
                    child: Text(
                      currentPage == 0
                          ? LocaleKeys.cancel.tr().toUpperCase()
                          : LocaleKeys.skip.tr().toUpperCase(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeState.isDark
                          ? ColorConstants.darkBackground
                          : ColorConstants.lightBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                      padding: (width <= 550)
                          ? const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20)
                          : const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 25),
                      textStyle: TextStyle(fontSize: (width <= 550) ? 13 : 17),
                    ),
                    child: Text(LocaleKeys.next.tr().toUpperCase(),
                        style: TextStyle(
                          color: themeState.isDark
                              ? ColorConstants.lightBackground
                              : ColorConstants.darkBackground,
                        )),
                  ),
                ],
              ),
            ),
          ],
        );
      })),
    );
  }
}
