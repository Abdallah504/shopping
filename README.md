# 🛍️ Shopping App

A modern, responsive Flutter e-commerce application with support for localization, dark/light mode, YouTube video integration, and more. Built with scalable architecture and enhanced user experience in mind.

---

## 🚀 Features

### 🌐 Multi-language Support
- Implemented using `easy_localization`.
- Supports dynamic switching between languages.
- Handles RTL and LTR layouts automatically.

### 🌙 Dark Mode & Light Mode
- Supports theme toggling based on user preference or system settings.
- Automatically adapts UI elements like text and background colors.

### 🎬 YouTube Video Integration
- Embedded YouTube player using `youtube_player_flutter`.
- Placed under sections like **Trending Products** to enhance content engagement.

### 🎞️ Lottie Animations
- Animated splash screens and transitions using `lottie`.
- Smooth and lightweight performance-friendly animations.

### 🖼️ Image Banners (Carousel)
- Interactive and auto-playing banner slider with `carousel_slider`.
- Fully responsive layout for various screen sizes.

### ⚙️ State Management with BLoC
- Built on `flutter_bloc` for robust and scalable state management.
- Clean separation between UI and business logic.

### 🌐 API Integration
- RESTful API integration using `dio` with error handling and interceptors.

### 📱 Responsive Design
- Utilizes `flutter_screenutil` to ensure pixel-perfect layout on all devices.

### 💾 Persistent Local Storage
- `shared_preferences` used for storing user data, settings, and preferences.

### 🛠️ Dependency Injection
- Uses `get_it` as a service locator for modular and testable code.

### 🧰 Native Configuration
- **Splash Screen**: Custom splash screen using `flutter_native_splash`.
- **App Icon**: Custom app launcher icons for Android and iOS with `flutter_launcher_icons`.

---

## 🧑‍💻 Getting Started

### ✅ Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio / Xcode
- Internet connection (for fetching API data and YouTube content)

### 📦 Install Dependencies

```bash
flutter pub get
