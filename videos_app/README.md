# videos_app

A Flutter vertical video feed demo (TikTok-style discover screen).

## Setup

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Add video files under `assets/videos/` (see [assets/videos/README.md](assets/videos/README.md)). Without them, the feed loads but players show an error state.

3. Run:

   ```bash
   flutter run
   ```

## Features

- Discover feed with paginated local data (`DiscoverProvider`)
- Vertical `PageView` with lazy video initialization (only the active page loads a decoder)
- Animation demo screens under `lib/presentation/screens/animations/`

## Tests

```bash
flutter test
flutter analyze
```
