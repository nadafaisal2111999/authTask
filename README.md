```markdown
# Auth & Social Feed App 📱🔥

A full-stack Flutter application featuring real-time authentication, dynamic post creation, real-time social feed integration, like system, and post management using Cloud Firestore and Firebase Authentication. Built with Clean Architecture principles and BLoC/Cubit state management.

---

## 📸 Screenshots

| | | |
| :---: | :---: | :---: |
| <img width="1212" height="2175" alt="Screenshot 2026-09-24 043657" src="https://github.com/user-attachments/assets/82c4500e-8cbf-47e9-a789-719e6945e07c" />
| <img width="1177" height="2145" alt="Screenshot 2026-09-24 043714" src="https://github.com/user-attachments/assets/811b1ab2-fdfe-4507-8bf7-58b99053fbb5" /> |
| <img width="1180" height="2050" alt="Screenshot 2026-09-24 043734" src="https://github.com/user-attachments/assets/91515924-7098-484c-9742-ffe5a5c4bf36" />
| <img width="1205" height="2042" alt="Screenshot 2026-09-24 043814" src="https://github.com/user-attachments/assets/fc6f0dea-3914-40d6-b948-000c0ef28c8c" />
 |
| <img width="1170" height="2030" alt="Screenshot 2026-09-24 043834" src="https://github.com/user-attachments/assets/dafbf9fb-d4e3-4ed0-9f42-602a638a3757" />
 | | |

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
