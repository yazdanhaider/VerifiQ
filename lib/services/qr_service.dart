class QRService {
  // QR code expiration time in milliseconds (2 minutes)
  static const int qrExpirationTime = 2 * 60 * 1000; // 2 minutes

  static String generateQRData(String userId) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return "$userId-$timestamp";
  }

  static String generateBaseQRData(String userId) {
    return userId;
  }

  // Parse QR data to extract user ID and timestamp
  static Map<String, dynamic> parseQRData(String qrData) {
    final parts = qrData.split('-');
    if (parts.length >= 2) {
      final userId = parts.take(parts.length - 1).join('-');
      final timestamp = int.tryParse(parts.last) ?? 0;
      return {'userId': userId, 'timestamp': timestamp};
    }
    return {'userId': qrData, 'timestamp': 0};
  }

  // Check if QR code is expired
  static bool isQRExpired(String qrData) {
    final parsed = parseQRData(qrData);
    final timestamp = parsed['timestamp'] as int;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    return (currentTime - timestamp) > qrExpirationTime;
  }

  // Get remaining time for QR code (in seconds)
  static int getRemainingTime(String qrData) {
    final parsed = parseQRData(qrData);
    final timestamp = parsed['timestamp'] as int;
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final remaining = qrExpirationTime - (currentTime - timestamp);

    return remaining > 0 ? (remaining / 1000).round() : 0;
  }

  // Validate QR code (check if valid and not expired)
  static Map<String, dynamic> validateQRCode(String qrData) {
    final parsed = parseQRData(qrData);
    final isExpired = isQRExpired(qrData);
    final remainingTime = getRemainingTime(qrData);

    return {
      'isValid': !isExpired,
      'isExpired': isExpired,
      'userId': parsed['userId'],
      'timestamp': parsed['timestamp'],
      'remainingTime': remainingTime,
      'message': isExpired
          ? 'QR code has expired'
          : 'QR code is valid (${remainingTime}s remaining)',
    };
  }
}
