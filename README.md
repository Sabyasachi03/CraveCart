# CraveCart

CraveCart is a Flutter-based food ordering app with:

- customer onboarding, signup, and login,
- category-based food browsing,
- cart and checkout,
- in-app wallet top-ups through Stripe,
- Firebase-backed data storage,
- a simple admin panel for adding food items.

This repository includes mobile, web, desktop Flutter targets, but the current implementation is primarily wired for Firebase on Android.

## What the project does

### Customer experience

- **Onboarding flow** with three introduction screens.
- **Authentication** with Firebase Auth (email + password signup/login).
- **Food browsing by category** (`Ice-cream`, `Pizza`, `Salad`, `Burger`) from Firestore collections.
- **Product details page** with quantity controls and add-to-cart.
- **Cart page** with:
  - live Firestore cart stream,
  - per-item delete,
  - total calculation,
  - wallet-balance checkout.
- **Wallet page**:
  - shows current wallet balance,
  - quick-select top-up amounts,
  - Stripe payment sheet integration,
  - syncs updated balance to SharedPreferences + Firestore.
- **Profile page** showing local user details and account actions (sign out / delete).

### Admin experience

- **Admin login** backed by Firestore `Admin` collection credentials.
- **Add food item** page to publish menu entries into category collections.

## Tech stack

- **Framework**: Flutter (Dart)
- **Backend services**: Firebase Auth + Cloud Firestore
- **Local persistence**: SharedPreferences
- **Payments**: Stripe (`flutter_stripe` + direct Stripe PaymentIntent API call)
- **Other packages**:
  - `curved_navigation_bar`
  - `image_picker`
  - `firebase_storage` (currently imported but not actively used in final add-item persistence)

## Project structure

```text
lib/
  main.dart                 # App bootstrap (Firebase + Stripe key)
  pages/
    onboard.dart            # Intro carousel
    signup.dart/login.dart  # User auth UI + Firebase Auth calls
    home.dart               # Category browsing + menu stream
    details.dart            # Item details + add-to-cart
    order.dart              # Cart, delete, checkout
    wallet.dart             # Wallet + Stripe top-up
    profile.dart            # User info + account actions
    bottom_nav.dart         # Main navigation container
  admin/
    admin_login.dart        # Admin auth check via Firestore
    home_admin.dart         # Admin landing
    add_food.dart           # Add menu items
  service/
    database.dart           # Firestore read/write helpers
    auth.dart               # Sign-out/delete helpers
    shared_pref.dart        # SharedPreferences wrapper
  widget/
    app_constant.dart       # Stripe keys/constants
    content_model.dart      # Onboarding models/data
    widget_support.dart     # Text style helpers
```

## Data model (Firestore)

CraveCart relies on this Firestore shape:

- `user/{userId}`
  - `Name` (string)
  - `Email` (string)
  - `Wallet` (string numeric)
  - `Id` (string)
  - subcollection `cart/{cartItemId}`
    - `Name` (string)
    - `Quantity` (string numeric)
    - `Total` (string numeric)

- Category collections (top-level):
  - `Ice-cream`
  - `Pizza`
  - `Salad`
  - `Burger`

  Each document typically has:
  - `Name` (string)
  - `Price` (string numeric)
  - `Details` (string)

- `Admin` (top-level collection)
  - expected fields:
    - `id`
    - `password`

## Setup guide

### 1) Prerequisites

Install:

- Flutter SDK (3.7+ recommended)
- Dart SDK (matching Flutter)
- Firebase project
- Stripe account (test mode for development)

### 2) Install dependencies

```bash
flutter pub get
```

### 3) Firebase configuration

This repo already contains `android/app/google-services.json`, and `main.dart` initializes Firebase directly with:

```dart
await Firebase.initializeApp();
```

To make your own project work end-to-end:

1. Create your Firebase project.
2. Register your Flutter apps.
3. Replace Firebase config files (at least Android `google-services.json`, and platform-specific configs as needed).
4. Ensure Firestore + Auth are enabled.

### 4) Stripe configuration

The app expects Stripe keys in `lib/widget/app_constant.dart`:

- `publishableKey`
- `secretKey`

> ⚠️ Important: the current architecture sends Stripe secret key from the client app when creating PaymentIntents. In production, move PaymentIntent creation to a secure backend (Cloud Functions / server API) and never ship secret keys in client code.

### 5) Seed Firestore

Before testing the UI flows:

- create `Admin` docs with `id` and `password`,
- create category collections (`Ice-cream`, `Pizza`, `Salad`, `Burger`) with food documents,
- optionally create test users by signing up from the app.

### 6) Run the app

```bash
flutter run
```

## Key flows to test

1. Launch app → onboarding.
2. Sign up as a new user.
3. Browse category items on Home.
4. Add item(s) to cart from Details.
5. Open Cart (Order tab), verify totals.
6. Top up wallet in Wallet tab.
7. Checkout cart using wallet balance.
8. Login as admin and add food items.

## Known limitations / notes

- Item images in customer menu are currently mapped from local category assets, not per-product uploaded images.
- `firebase_storage` and `image_picker` exist in admin add-item flow, but selected image is not persisted into Firestore product docs yet.
- Some fields (prices, wallet amounts, quantities) are stored as strings instead of numeric types.
- No robust role-based security model is implemented in client logic; Firebase Security Rules are essential.
- Profile picture handling is not fully implemented in current UI.

## Security recommendations before production

- Move all Stripe secret operations to backend.
- Rotate any exposed keys and use env-based config management.
- Enforce strict Firebase Security Rules for user/cart/admin boundaries.
- Validate all writes server-side.
- Store monetary values as integers (smallest currency unit) instead of strings.

## Future improvements

- Per-item image upload + CDN URLs.
- Search, filtering, and favorites.
- Order history and real order states.
- Better admin inventory management.
- Input validation hardening and error UX improvements.

## License

No license file is currently present in this repository. Add a `LICENSE` file if you plan to distribute or open-source this project formally.
