# SmartNewsDaily - Flutter News Aggregator

## 🔐 Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create project: `smartnewsdaily`
3. Add Android & iOS apps
4. Add Web app for deployment
5. Enable:
   - Firestore DB
   - Firebase Auth (Email/Anonymous)
   - Firebase Hosting (for web app)

### Firestore Collections
- `news_articles`: `{id, title, description, image_url, category, url, lang, is_premium}`
- `users`: `{uid, email, preferences, favorites}`
- `ads`: `{id, title, image_url, target_link}`

---

## 🚀 Features in Progress

### ✅ Home Page
- Top slider
- Category tabs
- Auto-refresh every 6 hours
- Local storage cache fallback

### ✅ NewsDetailsPage
- WebView
- Text-to-speech
- Read More
- Bookmark toggle

### ✅ Multilingual Support
- Uses `intl` for English & Hindi toggle
- Auto-translate API fallback (optional)

### ✅ Ads Banner Integration
- Demo ads with click tracking
- Optional future: Google AdMob

### ✅ Premium Section
- Toggle per article (`is_premium` = true)
- Lock + Subscribe UX
- Firebase user role check

### ✅ Newsletter
- Collect email
- Firebase Function or external cron (daily summary)
- Can send latest headlines

---

## 📦 Deployment

### Mobile
- Export Android APK
- iOS via Xcode (Apple dev account)

### Web
- `flutter build web`
- Deploy to Firebase Hosting

---

## ✅ Ready-to-Clone GitHub Setup

You will receive:
- `ZIP` with full project files
- `README.md` with setup guide
- `demo_ads` folder
- Placeholder images & JSON
- Language toggle and full backend support

---
