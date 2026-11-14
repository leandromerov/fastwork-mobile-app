# 📱 FastWork – Home Services Marketplace App

> A cross-platform mobile app that connects people with local home-service professionals (plumbers, electricians, locksmiths) in a few taps.

![Flutter](https://img.shields.io/badge/Flutter-3-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3-0175C2?logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-supported-3DDC84?logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-supported-000000?logo=apple&logoColor=white)
![CI](https://github.com/leandromerov/fastwork-mobile-app/actions/workflows/ci.yml/badge.svg)
![Status](https://img.shields.io/badge/status-UI%20prototype-orange)
![License](https://img.shields.io/badge/license-MIT-blue)

## The problem

Finding a trustworthy tradesperson quickly usually means asking around or scrolling through outdated listings. There is no simple, mobile-first way to browse services, contact a professional and keep track of past jobs.

## The solution

FastWork is the client app of a services marketplace. This repository contains the **UI prototype** (Spanish-language interface, targeting Latin American and Spanish-speaking users):

- **Authentication flow**: login and registration screens with form validation.
- **Home**: service search and quick-access category cards.
- **Services**: catalogue of available service categories.
- **History**: overview of previously requested jobs.
- **Profile**: user information and settings.
- Consistent visual identity (dark blue and yellow) and bottom-tab navigation.

The backend search engine for this idea is prototyped in [geolocalized-services-mvp](https://github.com/leandromerov/geolocalized-services-mvp).

## Architecture

```
lib/
├── main.dart             # App entry, LoginScreen, MainPage (bottom navigation)
├── register_screen.dart  # Sign-up form with validation
├── home_page.dart        # Search + suggested service categories
├── services_page.dart    # Service catalogue
├── history_page.dart     # Past requests
└── profile_page.dart     # User profile
test/
└── widget_test.dart      # Widget tests: login rendering and tab navigation
```

## Getting started

**Prerequisites:** [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.x and an emulator or device.

```bash
git clone https://github.com/leandromerov/fastwork-mobile-app.git
cd fastwork-mobile-app
flutter pub get
flutter run
```

Run the tests:

```bash
flutter test
```

No API keys or environment variables are required for the prototype. CI runs `flutter analyze` and the widget tests on every push.

## Roadmap

- [ ] Connect to the geolocalized search API
- [ ] Firebase Authentication
- [ ] Booking and in-app chat with professionals
- [ ] State management with Riverpod
- [ ] English localisation (i18n)

## Author

**Leandro Romero Villalobos** · IT Analyst & Programmer · Passau, Germany
[GitHub](https://github.com/leandromerov) · leandroromerovillalobos@gmail.com

## License

[MIT](LICENSE)
