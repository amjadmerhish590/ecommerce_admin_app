# 📦 Ecommerce Admin App

An admin panel Flutter application that allows administrators to manage an eCommerce platform.  
This app supports core functionalities like category and product management, employee and user control, order handling, and notifications.

## 🚀 Features

- 🔐 Login system for admin access
- 📊 Dashboard screen with quick access to:
    - Categories
    - Products
    - Customers
    - Employees
    - Notifications
    - Orders
- 🗂 Category Management:
    - View categories
    - Add new category
    - Edit category info
    - Delete category
- 🛍 Product Management:
    - View products
    - Add product
    - Edit product info
    - Delete product
- 👥 Employee Management:
    - View employees
    - Add new employees
    - Delete employees
- 📦 Order Management:
    - View orders waiting for approval
    - View approved orders
    - View archived orders
    - Order details and approval of available items


## 🔐 Sensitive Configuration Handling

- ✅ Sensitive Firebase configuration keys (`apiKey`, `appId`, `messagingSenderId`, `projectId`) are defined manually inside:

lib/core/services/services.dart

- ✅ These values are kept private and excluded from version control using `.gitignore`.

- ✅ Google Maps API key is stored locally using the `local.properties` file and passed through Gradle placeholders for secure integration.

## 🌐 `linkapi.dart`

This file contains all the API endpoints linking the app to the project's MySQL backend database.  
It manages the server address and various backend service access points.

> 🔄 Note:  
> Make sure to update the API URLs in this file whenever the server configuration or environment changes.

## 📁 Project Structure (Partial)

admin_app/
├── lib/
│ ├── bindings/
│ ├── controller/
│ ├── core/
│ │ ├── services/
│ │ │ └── services.dart
│ │ ├── class/
│ │ ├── constant/
│ │ ├── functions/
│ │ ├── localization/
│ │ ├── middleware/
│ │ └── shared/
│ ├── data/
│ ├── view/
│ ├── linkapi.dart
│ ├── main.dart
│ └── routes.dart
├── android/
│ └── app/
│ └── google-services.json (excluded)
├── ios/
├── pubspec.yaml
└── README.md


## 🧰 Technical Stack

| Tool/Library      | Purpose                                       |
|-------------------|-----------------------------------------------|
| Flutter           | Cross-platform mobile app development         |
| Firebase          | Notifications and core service initialization |
| GetX              | State management & dependency injection       |
| SharedPreferences | Local storage for persistent data             |
| MySQL             | Backend database for eCommerce data           |
| PHP APIs          | Server-side business logic and data handling  |
| Google Maps API   | Map services for delivery and location logic  |


## ⚙️ Notes

- The app is part of a full ecommerce system that includes:
    - `client_app`: for customers
    - `delivery_app`: for delivery drivers
    - `admin_app`: for store management

## 🚀 Getting Started

```bash
flutter pub get
flutter run