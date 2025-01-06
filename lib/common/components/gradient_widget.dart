import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molo/core/constants/color_constants.dart';

import '../../features/theme/bloc/theme_bloc.dart';
import '../../features/theme/bloc/theme_state.dart';

class GradientWidget extends StatefulWidget {
  const GradientWidget({super.key, required this.child});
  final Widget child;
  @override
  State<GradientWidget> createState() => _GradientWidgetPageState();
}

class _GradientWidgetPageState extends State<GradientWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Scaffold(
          body: SafeArea(
              top: false,
              bottom: false,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          !themeState.isDark
                              ? ColorConstants.darkPrimaryIcon
                              : ColorConstants.lightPrimaryIcon,
                          //  ColorConstants.lightBackground,
                          ColorConstants.darkBackground,
                          !themeState.isDark
                              ? ColorConstants.darkPrimaryIcon
                              : ColorConstants.lightPrimaryIcon,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.0, 0.48, 1],
                        tileMode: TileMode.clamp),
                  ),
                  child: widget.child)),
        );
      },
    );
  }
}
