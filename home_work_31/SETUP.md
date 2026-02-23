# Setup Instructions

## 1. Install Dependencies

Run the following command to install all required packages:

```bash
flutter pub get
```

## 2. Generate Code

After installing dependencies, generate the Freezed and JSON Serializable code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- `product_model.freezed.dart` and `product_model.g.dart`
- `products_bloc.freezed.dart`
- `products_event.freezed.dart`
- `products_state.freezed.dart`

## 3. Run the App

```bash
flutter run
```

## Features

### ✅ Freezed + JSON Serializable
- `ProductModel` with `fromJson`/`toJson` methods
- Located in: `lib/features/products/data/models/product_model.dart`

### ✅ Cached Network Image
- List with images, placeholder, and error widget
- Implemented in: `lib/features/products/presentation/widgets/product_list_item.dart`

### ✅ Internationalization (intl)
- Date and currency formatting
- Locale switching (ru/en)
- Helper class: `lib/core/utils/locale_helper.dart`

### ✅ Go Router
- 3 routes with parameters:
  1. `/` - Products list
  2. `/products/:id` - Product detail (with ID parameter)
  3. `/settings` - Settings page (with optional locale query parameter)

### ✅ Flutter Secure Storage
- Token storage demo
- Service: `lib/core/storage/secure_storage_service.dart`
- Demo UI in Settings page

## Troubleshooting

If you encounter errors after `flutter pub get`, make sure to run:

```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```
