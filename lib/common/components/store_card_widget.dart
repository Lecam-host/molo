import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/color_constants.dart';
import '../../features/theme/bloc/theme_bloc.dart';
import '../../features/theme/bloc/theme_state.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key, required this.store});
  final StoreModel store;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          // height: 100,
          //margin: const EdgeInsets.only(right: 5),

          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: themeState.isDark
                  ? ColorConstants.darkBackgroundColorContainer
                  : ColorConstants.darkBackground,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(store.image),
                  backgroundColor: ColorConstants.lightBackground,
                  // child: NetworkImageWithLoader(store.image, radius: 0),
                ),
              ),
              Text(
                store.name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: ColorConstants.lightBackground,
                    ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class StoreModel {
  final String name;
  final String image;
  String? route;
  StoreModel({required this.name, required this.image, this.route});
}
