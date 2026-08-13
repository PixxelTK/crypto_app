# crypto_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## API Key & How to Run

This project fetches data from the Coinranking API, so you need an API Key to run it properly.

### 1. How to get an API Key

- Go to the (https://account.coinranking.com/create-developer-account) - Sign up or log in.
- Get API Key (https://account.coinranking.com/dashboard/api)

### 2. How to run the project

There are two ways to run the project with your API Key:

#### Option 1: Using `--dart-define` (Recommended)

Run the application by passing the API Key via the command line:

```bash
flutter run --dart-define=API_KEY=your_api_key_here
```

_(Replace `your_api_key_here` with your actual API Key)_

#### Option 2: Hardcoding the API Key (Not recommended but easier for development)

You can directly paste your API Key into `lib/core/config/api_config.dart` by assigning it to the `apiKey` variable. Then, you can simply run:

```bash
flutter run
```
