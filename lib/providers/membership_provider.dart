import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/qr_service.dart';

class MembershipProvider extends ChangeNotifier {
  String _qrData = '';
  int _remainingTime = 0;
  bool _isExpired = false;
  Timer? _timer;
  final UserModel _user = UserModel.demoUser;

  // Getters
  String get qrData => _qrData;
  int get remainingTime => _remainingTime;
  bool get isExpired => _isExpired;
  UserModel get user => _user;

  MembershipProvider() {
    _initializeQRCode();
  }

  void _initializeQRCode() {
    _qrData = QRService.generateQRData(_user.id);
    _updateExpirationStatus();
    _startTimer();
  }

  void _updateExpirationStatus() {
    final validation = QRService.validateQRCode(_qrData);
    _remainingTime = validation['remainingTime'] as int;
    _isExpired = validation['isExpired'] as bool;
    notifyListeners();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateExpirationStatus();
      if (_isExpired) {
        timer.cancel();
      }
    });
  }

  void refreshQRCode() {
    _qrData = QRService.generateQRData(_user.id);
    _updateExpirationStatus();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
