# login page

## Setup Instructions

### 1. Get pub packages

```bash
flutter pub get
```

### 2. Rerun code generation

```bash
flutter pub run easy_localization:generate -O lib/constants/generated -S 'assets/translations'
```

```bash
flutter pub run easy_localization:generate -f keys -O lib/constants/generated -o app_strings.dart -S 'assets/translations'
```

### 3. Add keys for OAuth

Add `upload-keystore.jks` and `key.properties` to `android/` folder.
