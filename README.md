# ChatApp

ChatApp is a real-time chat application that utilizes Firebase for backend services, including authentication and database management. The app supports both dark and light themes and provides functionalities for user login and signup.

> **Note:** This is a work in progress. The application is still under development, and some features may be incomplete or subject to change.

## Features

- **Real-time Database**: Manages chat messages and user data using Firebase Realtime Database.
- **Authentication**: Provides login and signup functionality using Firebase Authentication.
- **Theming**: Supports both dark and light themes to enhance user experience.

## Packages Used

- **bloc**: Manages state using the BLoC pattern.
- **equatable**: Provides value equality for Dart objects.
- **firebase_auth**: Handles user authentication with Firebase.
- **firebase_core**: Initializes Firebase within the app.
- **cloud_firestore**: Manages Firestore database interactions for more complex data handling.

## Architecture

The project is organized into a structured architecture to ensure scalability and maintainability:

- **lib**: The main directory containing the application code.
  - **core**: Contains essential utilities and shared components used across the app.
    - **constants**: Defines application-wide constants.
    - **exceptions**: Manages custom exception classes.
    - **handlers**: Includes utility classes for handling various tasks.
    - **widgets**: Contains reusable UI widgets.
  - **features**: Represents different features or modules of the application.
    - **example_feature**: A sample feature demonstrating the structure.
      - **data**: Manages data sources, repositories, and data models.
      - **domain**: Contains business logic and entities.
      - **presentation**: Includes UI components, BLoC/Cubit, and screens.

## Setup

To get started with ChatApp, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/chatapp.git
   cd chatapp
2. **Run the Code**:
   ```bash
   flutter run 
