# Flutter App from Figma Design

A Flutter Android app generated from Figma design specifications.

## Features

### Implemented Screens
1. **Splash Screen** - Initial loading screen with logo and "Get Started" button
2. **Get Started Screen** - Welcome screen with continue button
3. **Choose Language Screen** - Language selection with radio buttons
4. **Login Screen** - Phone number input with country code selection
5. **OTP Screen** - 6-digit verification code input
6. **Home Screen** - Main dashboard with quick actions and transaction history

### Key Components
- Custom status bar matching Figma design
- Reusable custom button component
- Responsive design for Android devices
- Navigation flow between screens
- Form validation and input formatting
- OTP input with auto-focus functionality

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/                  # All screen widgets
│   ├── splash_screen.dart
│   ├── get_started_screen.dart
│   ├── choose_language_screen.dart
│   ├── login_screen.dart
│   ├── otp_screen.dart
│   └── home_screen.dart
├── widgets/                  # Reusable components
│   ├── custom_button.dart
│   └── status_bar.dart
└── utils/
    └── app_theme.dart        # Centralized theming
```

## Assets Required

Add these assets to match your Figma design:

### Images (`assets/images/`)
- `logo3.png` - Main app logo
- `left-side.png` - Status bar left side (time)
- `right-side.png` - Status bar right side (battery, signal)

### Fonts (`assets/fonts/`)
- `DMSans-Regular.ttf`
- `DMSans-Bold.ttf`

## Getting Started

1. **Install Flutter**: Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install)

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Add your assets**: 
   - Copy your Figma-exported images to `assets/images/`
   - Copy DM Sans font files to `assets/fonts/`

4. **Run the app**:
   ```bash
   flutter run
   ```

## Design Specifications

- **Primary Color**: #1E4CA1 (Blue)
- **Background**: White
- **Text Color**: #F4F4F4 (Light gray)
- **Font Family**: DM Sans
- **Button Border Radius**: 20px
- **Screen Width**: 430px (iPhone 14/15 Pro Max equivalent)

## TODO / Backend Integration

The following features need backend integration:

- [ ] Phone number validation
- [ ] OTP generation and verification
- [ ] User authentication
- [ ] Transaction data fetching
- [ ] Profile management
- [ ] Language preferences storage

## Customization

To match your exact Figma design:

1. Update colors in `lib/utils/app_theme.dart`
2. Replace placeholder assets with your Figma exports
3. Adjust spacing and dimensions in individual screen files
4. Add any missing UI elements from your Figma frames

## Notes

- The app is designed for portrait orientation
- All screens follow the same status bar design pattern
- Navigation uses standard Flutter MaterialPageRoute
- Form validation is implemented for phone and OTP inputs
- The home screen includes placeholder transaction data