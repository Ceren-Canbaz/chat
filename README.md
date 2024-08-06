# ChatApp

ChatApp is a real-time chat application that utilizes Firebase for backend services, including authentication and database management. The app supports both dark and light themes and provides functionalities for user login and signup.

> **Note:** This is a work in progress. The application is still under development, and some features may be incomplete or subject to change.

## Features

- **Real-time Database**: Manages chat messages and user data using Firebase Realtime Database.
- **Authentication**: Provides login and signup functionality using Firebase Authentication.
- **Profile Management**: Allows users to change username and change, add and remove profile photos.
- **Theming**: Supports both dark and light themes to enhance user experience.

## Packages Used

- **bloc**: Manages state using the BLoC pattern. https://pub.dev/packages/bloc
- **equatable**: Provides value equality for Dart objects. https://pub.dev/packages/equatable
- **firebase_auth**: Handles user authentication with Firebase. https://pub.dev/packages/firebase_auth
- **firebase_core**: Initializes Firebase within the app. https://pub.dev/packages/firebase_core
- **cloud_firestore**: Manages Firestore database interactions for more complex data handling. https://pub.dev/packages/cloud_firestore
- **hive**: Local storage for user settings.https://pub.dev/packages/hive
- **injectable**: Provides a code generator for dependency injection. https://pub.dev/packages/injectable
- **get_it**: A simple service locator for dependency injection. https://pub.dev/packages/get_it

## Architecture

The project is organized into a structured architecture to ensure scalability and maintainability:
```plaintext
lib/ (The main directory containing the application code.)
├── core/(Contains essential utilities and shared components used across the app.)
│   ├── colors/(Defines application colors.)
│   ├── themes/(Defines application themes.)
│   ├── constants/(Defines application-wide constants like enums.)
│   ├── exceptions/(Manages custom exception classes.)
│   ├── extensions/(Includes required extensions like DateFormatter or parser.)
│   ├── failures/(Manages custom failure classes.)
│   ├── handlers/(Includes utility classes for handling API requests, responses and errors.)
│   └── widgets/(Contains reusable UI widgets.)
├── features/
│   ├── example_feature/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   │   └── data_sources/
│   │   ├── domain/(Contains business logic and entities.)
│   │   │   ├── entities/
│   │   │   └── usecases/
│   │   └── presentation/(Includes UI components, BLoC/Cubit, and screens.)
│   │   │   ├── cubit/
│   │   │   └── views/
```


## Screens
<p align="center">
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/dark-login.png" alt="Dark Login Screen" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/dark-register.png" alt="Dark Register Screen" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/light-register.png" alt="Light Register Screen" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/dark-settings.png" alt="Dark Settings Screen" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/image-selection.png" alt="Image Selection" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/dark-with-profile-image.png" alt="Dark Settings Screen" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/light-settings.png" alt="Light Settings Screen" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/light-homepage.png" alt="Light Home Page Screen" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/light-drawer.png" alt="Light Drawer" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/light-chat-page.png" alt="Light Chat" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/light-pop-up.png" alt="Light Pop Up" width="200"/>
  <img src="https://github.com/Ceren-Canbaz/chat/blob/main/assets/app_images/light-edit-dialog.png" alt="Light Edit Dialog" width="200"/>
  
</p>
