import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molo/generated/locale_keys.g.dart';

import '../../../common/components/store_card_widget.dart';
import '../../../common/components/upcoming_card.dart';
import '../../../common/helpers/ui_helper.dart';
import '../../../common/widgets/see_more_button.dart';
import '../../theme/bloc/theme_bloc.dart';
import '../../theme/bloc/theme_state.dart';
import '../components/offers_carousel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Scaffold(
        // appBar: AppBar(
        //   title: const Text(LocaleKeys.home),
        // ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OffersCarousel(),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: UIHelper.deviceHeight * 0.01,
                      ),
                      SeeMoreButtonWidget(
                        title: LocaleKeys.store_in_vogue.tr(),
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: stores.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemBuilder: (context, index) {
                              return StoreCard(store: stores[index]);
                            }),
                      ),
                      SizedBox(
                        height: UIHelper.deviceHeight * 0.01,
                      ),
                      SeeMoreButtonWidget(
                        title: LocaleKeys.upcoming.tr(),
                      ),
                      const UpcomingCard(
                        title: 'Temu.com',
                        date: 'Oct 23',
                        amount: '12,50 €',
                        autopayText: 'Autopay dans 19 heures',
                        installmentText: '3 sur 3 (37 €)',
                        logoText: 'T',
                        logoColor: Colors.orange,
                      ),
                      const UpcomingCard(
                        title: 'Temu.com',
                        date: 'Oct 23',
                        amount: '12,50 €',
                        autopayText: 'Autopay dans 19 heures',
                        installmentText: '3 sur 3 (37 €)',
                        logoText: 'T',
                        logoColor: Colors.orange,
                      ),
                      const UpcomingCard(
                        title: 'Temu.com',
                        date: 'Oct 23',
                        amount: '12,50 €',
                        autopayText: 'Autopay dans 19 heures',
                        installmentText: '3 sur 3 (37 €)',
                        logoText: 'T',
                        logoColor: Colors.orange,
                      ),
                    ],
                  )),

              // ...List.generate(
              //   7,
              //   (index) => Container(
              //     margin: const EdgeInsets.only(bottom: 10),
              //     width: UIHelper.deviceWidth,
              //     height: 150,
              //     decoration: BoxDecoration(
              //       color: Theme.of(context).colorScheme.primaryContainer,
              //       borderRadius: const BorderRadius.all(Radius.circular(10)),
              //     ),
              //     child: Center(child: Text(index.toString())),
              //   ),
              // )
            ],
          ),
        ),
      );
    });
  }
}

List<StoreModel> stores = [
  StoreModel(
      image:
          "https://images.pexels.com/photos/8176112/pexels-photo-8176112.jpeg?auto=compress&cs=tinysrgb&w=600",
      name: 'Nike'),
  StoreModel(
      image:
          "https://images.pexels.com/photos/13748756/pexels-photo-13748756.jpeg?auto=compress&cs=tinysrgb&w=600",
      name: 'Apple'),
  StoreModel(
      image:
          "https://images.pexels.com/photos/7688702/pexels-photo-7688702.jpeg?auto=compress&cs=tinysrgb&w=600",
      name: 'Samsung'),
  StoreModel(
      image:
          "https://images.pexels.com/photos/1482061/pexels-photo-1482061.jpeg?auto=compress&cs=tinysrgb&w=600",
      name: 'Google pixel'),
];
