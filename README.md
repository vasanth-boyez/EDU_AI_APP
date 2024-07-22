+
# edu_ai

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# MyApp

Welcome to MyApp, a Flutter application for learning purposes.

## Features

1. [User Login Page]

# Application Blueprint

## User Login Page

### Inputs:
- Username
- Password

### Actions:
- Login
- Create Account

### JSON Responses:
#### Login Success:
```json
{
  "success": true,
  "message": "Login successful",
  "user": {
    "id": 1,
    "username": "john_doe",
    "email": "john.doe@example.com"
  }
}
```

2. [Create Account Feature]

# Create Account Feature

## Inputs:
- New Username
- New Password

## Actions:
- Create Account

### JSON Request (Example):
```json
{
  "username": "new_user",
  "password": "password123"
}
```


3. [User Dashboard]


# User Dashboard

## Description

The User Dashboard feature provides users with access to various sections of the application, including their profile, achievements, courses, and about information.

### Features

1. **Profile**: Allows users to view and manage their profile information.
2. **Achievements**: Displays the user's achievements and progress.
3. **Courses**: Shows a list of available courses for the user to enroll in.
4. **About**: Provides information about the application.

## JSON Responses

### User Profile

```json
{
  "username": "john_doe",
  "email": "john.doe@example.com",
  "address": "123 Main St, City",
  "phone": "+1234567890"
}
```

4. [Go Course Page]


# Go Course Page

## Description:
The Go Course Page displays a list of available courses related to the Go programming language.

### Features:
- Display list of Go courses
- Each course item includes the course name and instructor
- Users can tap on a course item to view more details or enroll in the course

## JSON Response (Example):
```json
[
  {
    "id": 1,
    "name": "Go Lang",
    "instructor": "John Doe"
  },
  {
    "id": 2,
    "name": "Advanced Go Programming",
    "instructor": "Jane Smith"
  },
  {
    "id": 3,
    "name": "Web Development with Go",
    "instructor": "Alex Johnson"
  }
]
```



5. [Interview]

# Go Course Page - Question and Interview 

## Description:
The `Question` and `Interview` classes are used to manage questions and interviews related to the Go programming language course.

### Question Class:

#### Description:
The `Question` class represents a single question in the Go programming language course.

#### Properties:
- **text**: The text of the question.
- **correctAnswer**: The correct answer to the question.

#### Example Usage:
```dart
Question(
  text: "What does 'fmt' stand for in Go?",
  correctAnswer: "format",
)
```



## Description

MyApp is a comprehensive Flutter application that includes various features such as user authentication, user dashboard, and a course page for learning Go programming language. It also demonstrates the use of classes like `Question` and `Interview` to manage course-related content.

## Setup

To run this application locally, make sure you have Flutter installed on your system. Then, clone this repository and navigate to the project directory. Run `flutter run` to start the application on your device or emulator.

## Contribution

Contributions to this project are welcome! If you have any suggestions, improvements, or bug fixes, feel free to submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
