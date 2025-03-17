# 🏀 NBA Flutter App

A **Flutter** mobile application that fetches **real-time NBA data** using the **RapidAPI** NBA endpoints. Built with **Riverpod** for state management.  

## 🚀 Features  
✅ Fetch NBA **teams list** 📋  
✅ Get **daily NBA scoreboard** 📊 (Live Scores & Match Results)  
✅ Built with **Flutter & Riverpod** for smooth state management  
✅ Consumes data from **RapidAPI**  

--- 

## 📸 Screenshots  

| NBA Teams | Scoreboard |
|-----------|-----------|
| <img src="screenshots/teams.png" width="250"/> | <img src="screenshots/scoreboard.png" width="250"/> |

---

## 🛠️ Tech Stack  

- **Flutter** (Dart) 🏗️  
- **Riverpod** (State Management) 🔄  
- **RapidAPI** (NBA Data API) 🌍  
- **HTTP Package** (API Requests)  

---

## 🔧 Installation & Setup  

1. **Clone the repository**  
   ```
   git clone https://github.com/Dev-Kings/nba-flutter-app.git
   cd nba-flutter-app

2. **Install Dependencies**
    ```
    flutter pub get

3. **Set up RapidAPI Key**
 - Create a .env file or update the NBA API key in nba_api_service.dart
    ```
    static const Map<String, String> _headers = {
        "X-RapidAPI-Key": "YOUR_RAPIDAPI_KEY",
    "   X-RapidAPI-Host": "your-nba-api-url.p.rapidapi.com",
    };
    ```

4. **Run the app**
    ```sh
    flutter run

## 🤝 Contributing
👋 Contributions are welcome!

1. Fork this repository
2. Create a branch (feature/your-feature)
3. Commit changes (git commit -m "Add feature XYZ")
4. Push to the branch (git push origin feature/your-feature)
5. Open a Pull Request 🚀

## 📜 License
This project is MIT Licensed 📜.

## 📞 Contact
📧 Email: kingasiadavid41@gmail.com
🐦 Twitter: @DaveKings8
📌 GitHub: Dev-Kings