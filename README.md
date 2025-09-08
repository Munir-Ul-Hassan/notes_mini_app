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

- **Notes:**
    - Create, edit, and delete notes.
    - Notes are stored locally on the device, so they are available offline.
    - A beautiful and intuitive UI for managing notes.
    - Undo delete functionality to prevent accidental data loss.
- **Posts:**
    - View a list of posts from a remote API.
    - The app fetches data from a placeholder API and displays it in a clean and readable format.
    - The UI is designed to be responsive and adapt to different screen sizes.
- **Settings:**
    - Change the theme of the app between light and dark mode.
    - The app uses Material 3 theming to provide a modern and consistent look and feel.