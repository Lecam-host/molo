import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/utils/router/routes.dart';
import '../login/bloc/login_bloc.dart';
import '../login/bloc/login_state.dart';
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
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
        ],
      )),
    );
  }
}
