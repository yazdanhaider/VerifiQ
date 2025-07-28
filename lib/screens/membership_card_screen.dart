import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/membership_provider.dart';
import '../widgets/membership_card_widget.dart';

class MembershipCardScreen extends StatelessWidget {
  const MembershipCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'VerifiQ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<MembershipProvider>(
        builder: (context, membershipProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                MembershipCardWidget(
                  user: membershipProvider.user,
                  qrData: membershipProvider.qrData,
                  onRefreshQR: membershipProvider.refreshQRCode,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
