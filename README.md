```markdown
# Auth & Social Feed App 📱🔥

A full-stack Flutter application featuring real-time authentication, dynamic post creation, real-time social feed integration, like system, and post management using Cloud Firestore and Firebase Authentication. Built with Clean Architecture principles and BLoC/Cubit state management.

---

## 📸 Screenshots

| | | |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/c6f9fbfd-9d6e-46de-af89-a73adb471069" width="250" /> | <img src="https://github.com/user-attachments/assets/40b375ed-d05c-405e-bc27-f34836a0a2b7" width="250" /> | <img src="https://github.com/user-attachments/assets/f9e8913b-cae0-4291-9c8f-8005c4dbf6fc" width="250" /> |
| <img src="https://github.com/user-attachments/assets/ab99e2f6-0f17-4cd2-9289-49975592a486" width="250" /> | <img src="https://github.com/user-attachments/assets/7481d23d-a431-45be-98e4-f33b2b944c04" width="250" /> | <img src="https://github.com/user-attachments/assets/9b5da764-e4b7-4cf2-9608-4cd750fc23d2" width="250" /> |
| <img src="https://github.com/user-attachments/assets/d9711111-e761-440e-b89f-013d261fdeda" width="250" /> | | |

---

## ✨ Key Features

- **🔐 User Authentication:**
  - Secure Login, Sign Up, Password Reset, and Auth State Listening (`AuthGate`).
  - State management powered by Flutter BLoC (`AuthCubit`).
  - Dependency Injection using `GetIt` and `Injectable`.

- **📝 Real-time Social Feed:**
  - Stream-based feed updating instantly upon post creation via Cloud Firestore `StreamBuilder`.
  - Custom UI for adding posts with real-time character count tracking (up to 500 characters).
  - Post validation alerts for empty content submissions using floating SnackBars.

- **❤️ Interactive Social Features:**
  - Real-time **Like/Unlike** functionality utilizing Firestore `FieldValue.arrayUnion` and `FieldValue.arrayRemove`.
  - Selective **Post Deletion** restricted exclusively to the original author with a confirmation dialog.
  - Sign-out capability directly from the Home Screen action bar.

---

## 🛠️ Tech Stack & Architecture

- **Framework:** Flutter (Dart)
- **Backend & Database:** Firebase Authentication, Cloud Firestore
- **State Management:** BLoC / Cubit
- **Architecture:** Clean Architecture (Presentation, Domain, Data layers)
- **Dependency Injection:** GetIt & Injectable

---

## 📂 Project Structure


```

lib/
├── core/
│   └── di/                     # Dependency Injection configuration
├── features/
│   ├── auth/
│   │   ├── data/               # Auth Data sources, models, & repositories
│   │   ├── domain/             # Auth Entities, repositories interfaces, & UseCases
│   │   └── presentation/       # Auth Cubit, States, and Views (Login, Signup, AuthGate)
│   └── fireStore/
│       ├── model/              # PostModel and Firestore mapping
│       └── presentation/       # HomeView & AddPost screens
└── main.dart                   # Entry point with Firebase initialization

```

---

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/nadafaisal2111999/authTask.git](https://github.com/nadafaisal2111999/authTask.git)

```

2. **Navigate to project directory:**
```bash
cd authTask

```


3. **Install dependencies:**
```bash
flutter pub get

```


4. **Run the application:**
```bash
flutter run

```



```

```
