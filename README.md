# VerifiQ - Virtual Membership Card

A modern Flutter application that provides users with a digital membership card featuring dynamic QR code generation for seamless check-in and verification processes.

<img width="1920" height="1080" alt="verifyQ" src="https://github.com/user-attachments/assets/63287614-6f0e-4081-90b6-b948b85fc2ac" />

## 🎯 Overview

VerifiQ is designed to streamline the membership verification process by providing users with a virtual membership card accessible on their mobile devices. The app generates unique, time-sensitive QR codes that partners can scan to verify bookings or memberships in real-time.

## ✨ Features

### 🔐 Dynamic QR Code Generation

- **Time-sensitive tokens** - QR codes expire every 2 minutes
- **Unique generation** - Each refresh creates a new, secure token
- **Real-time validation** - Partners can verify authenticity instantly

### 🎨 Beautiful User Interface

- **Modern design** - Clean, professional card layout
- **Gradient headers** - Eye-catching visual elements
- **Responsive design** - Works perfectly on all screen sizes
- **Brand integration** - Custom VerifiQ logo and branding

### 📱 User Experience

- **Single-screen app** - Simple, intuitive interface
- **Live countdown** - Real-time expiration timer
- **Visual feedback** - Clear status indicators (valid/expired)
- **One-tap refresh** - Easy QR code regeneration

### 🔒 Security Features

- **Expiration logic** - Automatic token invalidation
- **Timestamp validation** - Prevents replay attacks
- **Dynamic tokens** - No static QR codes
- **Secure verification** - Time-based authentication

## 🛠️ Technical Stack

- **Framework**: Flutter 3.8.1+
- **State Management**: Provider
- **QR Generation**: qr_flutter
- **Icons**: Iconsax
- **Platforms**: iOS & Android

## 📋 Requirements

- Flutter SDK: ^3.8.1
- Dart: ^3.0.0
- iOS: 13.0+
- Android: API level 21+

## 🚀 Installation

### Prerequisites

1. Install [Flutter](https://flutter.dev/docs/get-started/install)
2. Install [Dart](https://dart.dev/get-dart)
3. Set up your development environment

### Setup Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/yazdanhaider/VerifiQ
   cd verifiq
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate app icons**

   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Usage

### For Users

1. **Open the app** - Launch VerifiQ on your device
2. **View your card** - See your membership information
3. **Present QR code** - Show the QR code to partners
4. **Refresh when needed** - Tap "Refresh QR Code" for new token

### For Partners

1. **Scan QR code** - Use any QR scanner app
2. **Validate token** - Check if QR code is still valid
3. **Verify user** - Confirm membership status
4. **Grant access** - Provide service based on validation

## 🔧 Configuration

### QR Code Expiration

The default expiration time is 2 minutes. To modify:

```dart
// In lib/services/qr_service.dart
static const int qrExpirationTime = 2 * 60 * 1000; // 2 minutes
```

### User Information

Update user details in:

```dart
// In lib/models/user_model.dart
static const UserModel demoUser = UserModel(
  id: 'user-id-12345-abcde',
  name: 'Alex Ray',
  membershipLevel: 'Platinum Member',
);
```

## 🏗️ Project Structure

```
lib/
├── constants/
│   ├── app_colors.dart      # Color scheme
│   └── app_text_styles.dart # Typography
├── models/
│   └── user_model.dart      # User data model
├── providers/
│   └── membership_provider.dart # State management
├── screens/
│   └── membership_card_screen.dart # Main screen
├── services/
│   └── qr_service.dart      # QR generation logic
├── widgets/
│   ├── membership_card_widget.dart # Card UI
│   └── qr_code_widget.dart  # QR display
└── main.dart                # App entry point
```

## 🔍 QR Code Format

QR codes contain the following data structure:

```
user-id-12345-abcde-1753650309346
│        │                    │
│        │                    └── Timestamp (milliseconds)
│        └── User ID
└── Static prefix
```

### Validation Process

1. **Extract user ID** - Parse the base identifier
2. **Check timestamp** - Verify token freshness
3. **Validate expiration** - Ensure within time window
4. **Grant access** - Provide service if valid

## 🎨 Customization

### Colors

Modify the app's color scheme in `lib/constants/app_colors.dart`:

```dart
class AppColors {
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF8B5CF6);
  // Add your custom colors
}
```

### Typography

Update text styles in `lib/constants/app_text_styles.dart`:

```dart
class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  // Add your custom styles
}
```

## 📦 Building for Production

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```


## 🔮 Future Enhancements

- [ ] Multi-user support
- [ ] Offline mode
- [ ] Push notifications
- [ ] Analytics dashboard
- [ ] Partner verification app
- [ ] Biometric authentication

---

**Built with ❤️ using Flutter**

_VerifiQ - Simplifying membership verification in the digital age_
