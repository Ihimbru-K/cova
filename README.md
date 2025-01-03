
# Insurance Subscription Management Solution

Welcome to the **Cova Insurance Subscription Management Solution** repository. This project is part of a technical assessment challenge aimed at building a Flutter-based mobile application for managing insurance subscriptions. Below, you will find details on the application architecture, technologies used, and setup instructions to help you run the project.

## Project Overview

The mobile application allows users to:

- **Log in securely** using Firebase Authentication (email and password).
- **Browse available insurance products**, fetched from a mock API.
- **Subscribe to an insurance product** by selecting it from the list.
- **View their subscriptions**, including detailed information such as product name, subscription date, and coverage dates.

## Key Features

- **Secure Authentication**: Firebase Authentication ensures a safe login system.
- **State Management**: Provider package is used for efficient and scalable state management.
- **REST API Consumption**: Products and subscription data are fetched from a mock API for demonstration purposes.
- **MVC Design Pattern**: The project follows the Model-View-Controller pattern for clear separation of concerns.

## Application Architecture

The application is structured around the **MVC design pattern**, ensuring modularity and readability.

- **Model**: Represents the data layer, including data models for `Product` and `Subscription`.
- **View**: Handles the user interface, providing an intuitive and clean design.
- **Controller**: Manages application logic, such as fetching products and subscriptions.

## Technologies Used

1. **Flutter**: For building the cross-platform mobile application.
2. **Firebase**: Provides secure user authentication.
3. **Provider**: State management solution for Flutter.
4. **Mock API**: Simulates backend data for insurance products and subscriptions.
5. **HTTP**: For API requests and responses.

## Setup Instructions

Follow these steps to set up and run the application locally:

### Prerequisites

- Flutter SDK installed ([installation guide](https://flutter.dev/docs/get-started/install)).
- A Firebase project set up ([Firebase Console](https://console.firebase.google.com/)).
- Mock API for data ([MockAPI.io](https://mockapi.io/)).

### Steps

#### Clone the Repository

```bash
git clone https://github.com/Ihimbru-K/cova.git
cd cova
```

#### Install Dependencies

Run the following command to install required packages:

```bash
flutter pub get
```

#### Configure Firebase

1. Download the `google-services.json` file from your Firebase project and place it in the `android/app` directory.
2. Ensure Firebase Authentication is enabled for email and password login.

#### Run the Application

Launch the application in a connected device or emulator:

```bash
flutter run
```

## Mock API Endpoints

The application consumes the following mock API endpoint:

- **Get Products**: `https://67665728410f8499965765c3.mockapi.io/insuraease/api/v1/Products`
- **subsribed Products**: `https://67665728410f8499965765c3.mockapi.io/insuraease/api/v1/Subscriptions`

Example response:

```json
[
  {
    "id": "1",
    "name": "Health Insurance",
    "description": "Covers medical expenses and emergencies.",
    "amount": "500"
  },
  {
    "id": "2",
    "name": "Car Insurance",
    "description": "Comprehensive car coverage.",
    "amount": "300"
  }
]
```

## File Structure

Key files and directories:

- **`lib/models/product_model.dart`**: Defines the `Product` model.
- **`lib/services/product_service.dart`**: Handles fetching product data from the API.
- **`lib/screens/`**: Contains UI screens such as login, product listing, and subscription details.
- **`lib/providers/`**: Manages state using Provider.

## Example Code Snippet

**Fetching Products from Mock API**

```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/product_model.dart';

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://67665728410f8499965765c3.mockapi.io/insuraease/api/v1/Products'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products = data.map((item) => Product(
        name: item['name'],
        description: item['description'],
        amount: item['amount'],
        id: item['id'],
      )).toList();

      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
```

## Screenshots

Add screenshots of the application screens and API responses here.

## Future Improvements

- Integration with a real backend system.
- Advanced filtering and sorting options for insurance products.
- Push notifications for subscription updates.

## Author

**Ihimbru-K**  
Feel free to reach out for any questions or feedback!

---

Thank you for exploring this project!
``` 

This file is ready to copy and paste into your `README.md`. Let me know if you need any changes or additions!
