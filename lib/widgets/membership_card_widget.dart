import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../models/user_model.dart';
import 'qr_code_widget.dart';

class MembershipCardWidget extends StatelessWidget {
  final UserModel user;
  final String qrData;
  final VoidCallback onRefreshQR;

  const MembershipCardWidget({
    super.key,
    required this.user,
    required this.qrData,
    required this.onRefreshQR,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with gradient
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.secondary],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                // Profile Picture Placeholder
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Iconsax.user,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 15),
                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.crown,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            user.membershipLevel,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // QR Code Section
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Scan to Verify', style: AppTextStyles.subheading),
                const SizedBox(height: 15),
                QRCodeWidget(qrData: qrData),
                const SizedBox(height: 20),
                // Refresh Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onRefreshQR,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonPrimary,
                      foregroundColor: AppColors.buttonText,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Iconsax.refresh),
                    label: const Text('Refresh QR Code'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
