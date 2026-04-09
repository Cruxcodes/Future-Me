# FutureMe — Your Very Own Mentor

**FutureMe** is an AI-powered goal-setting and task management mobile application built with Flutter. It helps users turn ambitious life goals into manageable daily tasks by leveraging OpenAI's GPT-3.5 to generate personalised action plans. Stay motivated with daily inspirational quotes and beat boredom with curated activity suggestions.

> 🎓 Built as a Final Year Project.

---

## ✨ Features

| Feature | Description |
|---|---|
| **AI-Powered Goal Planning** | GPT-3.5 generates a daily task list tailored to your goal, timeframe, and preferred number of tasks. Don't like the list? Regenerate it instantly. |
| **Goal Tracking** | View all your goals in a grid, open any goal to see its full task list, and track how many days you've completed. |
| **User Authentication** | Email/password sign-up and login powered by Firebase Auth. |
| **Motivational Quotes** | A fresh inspirational quote is displayed on the home screen every session, fetched from the Zen Quotes API. |
| **Boredom Buster** | Feeling stuck? Get random activity suggestions for yourself or with friends via the BoredAPI. |
| **Real-Time Sync** | Goals and progress are stored in Cloud Firestore with real-time streams, so data stays in sync across sessions. |

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Framework** | Flutter (Dart) |
| **State Management** | Riverpod |
| **Routing** | GoRouter |
| **Backend / Database** | Firebase (Auth + Cloud Firestore) |
| **AI Integration** | OpenAI GPT-3.5 Turbo (via Dio HTTP client) |
| **External APIs** | Zen Quotes API · BoredAPI |
| **UI Extras** | Google Fonts · Flutter ScreenUtil · Animated Text Kit · Flutter SpinKit |

---

## 📂 Project Structure

```
lib/
├── main.dart                  # App entry point & Firebase initialisation
├── constants/
│   ├── constants.dart         # App-wide configuration (API keys, etc.)
│   └── routes.dart            # GoRouter route definitions
├── model/
│   ├── FutureMeAiModel.dart   # OpenAI chat-completion response model
│   ├── GoalModel.dart         # Goal data structure
│   ├── UserModel.dart         # User profile model
│   ├── QuotesModel.dart       # Motivational quote model
│   ├── BoredApi.dart          # Bored activity model
│   └── AuthError.dart         # Authentication error model
├── services/
│   ├── ai_api_call.dart       # OpenAI API integration (task generation)
│   ├── auth.dart              # Firebase Auth sign-up / sign-in / sign-out
│   ├── firestore.dart         # Firestore CRUD for goals & progress
│   ├── bored_api_services.dart# BoredAPI integration
│   ├── quotes.dart            # Zen Quotes API integration
│   └── user_tasks.dart        # (Placeholder for future task utilities)
├── views/
│   ├── SplashScreen.dart      # Animated launch screen
│   ├── login_view.dart        # Login page
│   ├── register.dart          # Registration page
│   ├── intitial_homepaege.dart# Main scaffold with bottom navigation
│   ├── homepage.dart          # Home page with goals overview & daily quote
│   ├── create_future.dart     # Goal creation form
│   ├── chat_response.dart     # AI-generated task list review & accept
│   ├── goals_page.dart        # All goals grid view
│   ├── single_task_page.dart  # Individual goal detail & progress tracker
│   └── bored_page.dart        # Boredom relief activity picker
├── components/
│   ├── app_text_field.dart    # Custom text input widget
│   ├── btn.dart               # Reusable button widget
│   ├── bottom_navigation.dart # Bottom navigation bar
│   ├── bored_activities/      # Bored activity UI components
│   ├── shared/                # Shared UI components
│   └── task/                  # Task-related UI components
└── assets/
    ├── images/                # Static image assets
    └── videos/                # Video assets
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (≥ 3.1.2)
- A Firebase project with **Authentication** and **Cloud Firestore** enabled
- An [OpenAI API key](https://platform.openai.com/account/api-keys)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Cruxcodes/Future-Me.git
   cd Future-Me
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Set up a Firebase project and enable Email/Password authentication and Cloud Firestore.
   - Run the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) to generate your `firebase_options.dart`, or replace the existing file with your own configuration:
     ```bash
     flutterfire configure
     ```

4. **Add your OpenAI API key**
   - Open `lib/constants/constants.dart` and set your API key:
     ```dart
     const String apiKey = 'YOUR_OPENAI_API_KEY';
     ```

5. **Run the app**
   ```bash
   flutter run
   ```

---

## 📱 App Flow

```
Splash Screen
    │
    ▼
Login / Register
    │
    ▼
┌──────────────────────────────────┐
│  Home (Bottom Navigation)        │
│  ┌────────┬─────────┬──────────┐ │
│  │  Home  │  Goals  │  Bored   │ │
│  └────────┴─────────┴──────────┘ │
└──────────────────────────────────┘
    │              │           │
    ▼              ▼           ▼
Daily Quote    All Goals    Activity
& Recent       Grid View    Suggestions
  Goals            │
    │              ▼
    ▼         Single Goal
Create Goal   Detail &
    │         Progress
    ▼
AI Generates
Task List
    │
    ▼
Review & Accept
(or Regenerate)
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🙏 Acknowledgements

- [OpenAI](https://openai.com/) — GPT-3.5 Turbo for intelligent task generation
- [Firebase](https://firebase.google.com/) — Authentication & real-time database
- [Zen Quotes API](https://zenquotes.io/) — Daily motivational quotes
- [BoredAPI](https://www.boredapi.com/) — Activity suggestions
- [Flutter](https://flutter.dev/) — Cross-platform UI framework
