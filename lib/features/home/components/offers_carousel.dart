import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/components/Banner/M/banner_m_style_1.dart';
import '../../../common/components/dot_indicators.dart';
import '../../../core/constants/app_constants.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  // Offers List
  List offers = [
    // BannerVideo(
    //   title: 'Test Video',
    //   press: () {},
    // ),
    BannerMStyle1(
      text: "Acherter vos telephones a votre rythme",
      image:
          "https://images.pexels.com/photos/15493878/pexels-photo-15493878/free-photo-of-main-apple-pomme-smartphone.jpeg?auto=compress&cs=tinysrgb&w=600",
      press: () {},
    ),
    BannerMStyle1(
      text: "Habillez-vous et payer apres",
      image:
          "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=600",
      press: () {},
    ),
    // BannerMStyle2(
    //   title: "Black \nfriday",
    //   subtitle: "Collection",
    //   discountParcent: 50,
    //   press: () {},
    // ),
    // BannerMStyle3(
    //   title: "Grab \nyours now",
    //   discountParcent: 50,
    //   press: () {},
    // ),
    // BannerMStyle4(
    //   // image: , user your image
    //   title: "SUMMER \nSALE",
    //   subtitle: "SPECIAL OFFER",
    //   discountParcent: 80,
    //   press: () {},
    // ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_selectedIndex < offers.length - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            onPageChanged: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) => offers[index],
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 16,
                child: Row(
                  children: List.generate(
                    offers.length,
                    (index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: defaultPadding / 4),
                        child: DotIndicator(
                          isActive: index == _selectedIndex,
                          activeColor: Colors.white70,
                          inActiveColor: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
