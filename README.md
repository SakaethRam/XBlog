# XBlog

XBlog is a Flutter-based blogging application designed with an anime-inspired aesthetic and integrated with Firebase for secure user authentication. It features interactive UI components, custom theming, and modular architecture, making it suitable for content-rich storytelling and blog publishing platforms.

---

## Features

- Firebase Authentication for user login and registration.
- Dynamic theming using Provider with support for light and dark modes.
- Multi-page blog UI including featured blog views such as XBlog, XBlogArk2, and XBlogArk3.
- Animated and styled blog cards with detailed views.
- Draggable bottom sheet overlays for blog discovery and navigation.
- Bottom navigation bar for seamless user experience across home, explore, and profile sections.
- Organized and modular codebase with separation of concerns.

---

## Getting Started

### Prerequisites
- Flutter SDK
- Firebase project (with Android and iOS configurations)
- IDE with Flutter support (e.g., Android Studio, VS Code)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/xblog.git
   cd xblog
   ```

2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Install Firebase dependencies:
   ```bash
   firestore pub install
   ```

4. Configure Firebase:
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files to the appropriate directories.
   - Ensure `firebase_options.dart` is generated using `flutterfire configure`.

5. Run the application:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── Auth/               # Handles authentication views and logic
├── Design/             # Reusable UI components and design elements
├── Home/               # Contains home screen and navigation logic
├── Models/             # Includes providers and shared models
├── Themes/             # Theme configuration and provider setup
├── main.dart           # Main entry point of the application
├── details.dart        # Blog details and content view
├── scroll_search.dart  # Search and scrollable blog content
```

---

![Sign In_Up](https://github.com/user-attachments/assets/fffedcde-8531-44fe-a46d-2b93dcee043b)

![Home](https://github.com/user-attachments/assets/aad1049d-fe90-49a1-b44b-b95cf5f2df67)

![Forum](https://github.com/user-attachments/assets/6553e43a-e5c8-4674-8f38-9d359c6ef383)

![Settings](https://github.com/user-attachments/assets/e0e94c29-2824-4ad6-bb24-a9424f6d784e)

![XBlog](https://github.com/user-attachments/assets/6b593665-214c-4850-a5f7-41b427018c58)
 
---

## Notes

- Ensure the necessary fonts such as ModernAntiqua, Merienda, and Poppins are added to `pubspec.yaml`.
- The app structure supports expansion with additional blog styles and UI enhancements.

---

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

