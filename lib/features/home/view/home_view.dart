import 'package:flutter/material.dart';
import 'package:molo/generated/locale_keys.g.dart';

import '../components/offers_carousel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.home),
      ),
      body: const Column(
        children: [
          OffersCarousel(),
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
    );
  }
}
