import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../constants/app_colors.dart';
import '../providers/membership_provider.dart';

class QRCodeWidget extends StatelessWidget {
  final String qrData;

  const QRCodeWidget({super.key, required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Consumer<MembershipProvider>(
      builder: (context, membershipProvider, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: membershipProvider.isExpired
                  ? Colors.red
                  : AppColors.cardShadow,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
                eyeStyle: QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: membershipProvider.isExpired
                      ? Colors.red
                      : AppColors.textPrimary,
                ),
                dataModuleStyle: QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: membershipProvider.isExpired
                      ? Colors.red
                      : AppColors.textPrimary,
                ),
                errorCorrectionLevel: QrErrorCorrectLevel.H,
              ),
              const SizedBox(height: 10),
              // Expiration status
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: membershipProvider.isExpired
                      ? Colors.red.withValues(alpha: 0.1)
                      : Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  membershipProvider.isExpired
                      ? 'Expired'
                      : 'Valid (${membershipProvider.remainingTime}s)',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: membershipProvider.isExpired
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
