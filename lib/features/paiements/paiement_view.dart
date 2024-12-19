import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/upcoming_card.dart';
import '../../common/widgets/see_more_button.dart';
import '../../core/constants/color_constants.dart';
import '../../generated/locale_keys.g.dart';
import '../theme/bloc/theme_bloc.dart';
import '../theme/bloc/theme_state.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Scaffold(
        // backgroundColor: const Color(0xFF1A1B1E),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Status Bar
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text(
                //       '00:55',
                //       style: TextStyle(color: Colors.white, fontSize: 16),
                //     ),
                //     Row(
                //       children: [
                //         const Icon(Icons.signal_cellular_alt,
                //             color: Colors.white),
                //         const SizedBox(width: 4),
                //         const Icon(Icons.wifi, color: Colors.white),
                //         const SizedBox(width: 4),
                //         Container(
                //           padding: const EdgeInsets.symmetric(horizontal: 4),
                //           decoration: BoxDecoration(
                //             color: Colors.green,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: const Text(
                //             '46%',
                //             style: TextStyle(color: Colors.white, fontSize: 12),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),

                // Header
                // const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: const Text('P',
                          style: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Paiements',
                      style: TextStyle(
                        color: themeState.isDark
                            ? ColorConstants.lightBackground
                            : ColorConstants.darkBackground,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // Total Amount
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Montant total dû',
                        style: TextStyle(
                          color: themeState.isDark
                              ? ColorConstants.lightBackground
                              : ColorConstants.darkBackground,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '242,41 €',
                        style: TextStyle(
                          color: themeState.isDark
                              ? ColorConstants.lightBackground
                              : ColorConstants.darkBackground,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Tous les paiements à venir sont programmés',
                        style: TextStyle(
                          color: themeState.isDark
                              ? ColorConstants.lightBackground
                              : ColorConstants.darkBackground,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                // Quick Actions Grid
                const SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     _buildQuickActionCard(
                //       'Tous les achats',
                //       'Dernier · 2 oct.',
                //       [
                //         _buildLogo('R', Colors.red),
                //         _buildLogo('S', Colors.white),
                //         _buildLogo('T', Colors.orange),
                //       ],
                //     ),
                //     _buildQuickActionCard(
                //       'Retour et\nremboursement',
                //       'Aucun en cours',
                //       [const Icon(Icons.repeat, color: Colors.white)],
                //     ),
                //   ],
                // ),

                // October Payments Section
                const SizedBox(height: 30),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'À payer en octobre',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     Text(
                //       '51,41 €',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 16,
                //       ),
                //     ),
                //   ],
                // ),

                // Payment List
                SeeMoreButtonWidget(
                  title: LocaleKeys.upcoming.tr(),
                ),
                Expanded(
                  child: ListView(
                    children: const [
                      UpcomingCard(
                        title: 'Temu.com',
                        date: 'Oct 23',
                        amount: '12,50 €',
                        autopayText: 'Autopay dans 19 heures',
                        installmentText: '3 sur 3 (37 €)',
                        logoText: 'T',
                        logoColor: Colors.orange,
                      ),
                      UpcomingCard(
                        title: 'SHEIN',
                        date: 'Oct 23',
                        amount: '12,50 €',
                        autopayText: 'Autopay dans 19 heures',
                        installmentText: '3 sur 3 (37 €)',
                        logoText: 'S',
                        logoColor: Colors.black,
                      ),
                      UpcomingCard(
                        title: 'Temu.com',
                        date: 'Oct 23',
                        amount: '12,50 €',
                        autopayText: 'Autopay dans 19 heures',
                        installmentText: '3 sur 3 (37 €)',
                        logoText: 'T',
                        logoColor: Colors.red,
                      ),
                    ],
                  ),
                ),

                // Bottom Navigation
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildQuickActionCard(
      String title, String subtitle, List<Widget> logos) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2B2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: logos),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(String text, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: color == Colors.white ? Colors.black : Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentItem(
    String title,
    String date,
    String amount,
    String autopayText,
    String installmentText, {
    required String logoText,
    required Color logoColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          _buildLogo(logoText, logoColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  autopayText,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
                if (installmentText.isNotEmpty)
                  Row(
                    children: [
                      Text(
                        installmentText,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                      // const SizedBox(width: 4),
                      // Image.asset(
                      //   'assets/visa.png',
                      //   width: 24,
                      //   height: 16,
                      // ),
                      const SizedBox(width: 4),
                      Text(
                        '••••9207',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
