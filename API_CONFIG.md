# Google API Configuration

## Google Places API Key

To enable place search with autocomplete, you need to add your Google Places API key.

### Steps to get API key:

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the following APIs:
   - Places API
   - Maps SDK for Android
   - Maps SDK for iOS
4. Go to "Credentials" and create an API key
5. Copy your API key

### Add API key to the app:

Open `lib/features/result/presentation/screen/result_screen.dart` and replace:

```dart
googleAPIKey: "YOUR_GOOGLE_API_KEY"
```

with:

```dart
googleAPIKey: "YOUR_ACTUAL_API_KEY_HERE"
```

**Note:** For production apps, store API keys securely using environment variables or secure storage, not hardcoded in the source code.
