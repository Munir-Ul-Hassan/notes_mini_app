# Notes Mini-App

A simple offline notes app built with Flutter using MVVM architecture, Material 3 theming, and local persistence.

## Setup

1. **Clone the repo:**
   ```
   git clone https://github.com/yourusername/notes_mini_app.git
   cd notes_mini_app
   ```

2. **Install dependencies:**
   ```
   flutter pub get
   ```

3. **Generate Hive adapters:**
   ```
   dart run build_runner build
   ```

4. **Run the app:**
   ```
   flutter run
   ```

## Decisions

- **Architecture:** MVVM (View, ViewModel, Repository/Service)
- **Persistence:** Hive for offline storage
- **State Management:** Provider
- **Theming:** Material 3, light/dark, seed color
- **UI:** Responsive, accessible, modern
- **Undo Delete:** SnackBar with Undo action

## Features

- Add, edit, delete notes
- Undo delete via SnackBar
- Theme toggle (light/dark)
- Local persistence
