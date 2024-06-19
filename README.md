## Wallpaper

Using the `async_wallpaper` package in Flutter allows you to set wallpapers asynchronously. This package provides an easy way to interact with wallpapers on both Android and iOS. Below is a step-by-step guide on how to use this package in your Flutter project.

### Step 1: Add the dependency

First, add the `async_wallpaper` dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  async_wallpaper: ^1.0.6 # Check for the latest version on pub.dev
```

Then, run `flutter pub get` to install the new dependency.

### Step 2: Import the package

In your Dart file, import the `async_wallpaper` package:

```dart
import 'package:async_wallpaper/async_wallpaper.dart';
```

### Step 3: Set up the function to change the wallpaper

Create a function that sets the wallpaper using the `async_wallpaper` package. Here’s an example function that sets a wallpaper from a URL:

```dart
Future<void> setWallpaper(String url) async {
  try {
    // Set wallpaper
    String result = await AsyncWallpaper.setWallpaper(
      url: url, 
      wallpaperLocation: AsyncWallpaper.HOME_SCREEN, // You can also use AsyncWallpaper.LOCK_SCREEN or AsyncWallpaper.BOTH_SCREENS
      goToHome: true // If true, it will take the user to the home screen after setting the wallpaper
    );

    print(result); // This will print 'Wallpaper set' on success
  } catch (e) {
    print(e);
  }
}
```

### Step 4: Call the function

You can call this function from a button or any other event within your Flutter app. Here’s an example using a button:

```dart
import 'package:flutter/material.dart';
import 'package:async_wallpaper/async_wallpaper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WallpaperScreen(),
    );
  }
}

class WallpaperScreen extends StatelessWidget {
  final String wallpaperUrl = 'https://example.com/wallpaper.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Wallpaper Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => setWallpaper(wallpaperUrl),
          child: Text('Set Wallpaper'),
        ),
      ),
    );
  }

  Future<void> setWallpaper(String url) async {
    try {
      String result = await AsyncWallpaper.setWallpaper(
        url: url,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
      );

      print(result);
    } catch (e) {
      print(e);
    }
  }
}
```

### Additional Options

The `AsyncWallpaper.setWallpaper` function can take several parameters:

- `url`: The URL of the image you want to set as wallpaper.
- `wallpaperLocation`: The location where you want to set the wallpaper (e.g., home screen, lock screen, or both).
- `goToHome`: Whether to navigate to the home screen after setting the wallpaper.
- `crop`: Whether to crop the image before setting it (only available on Android).

Make sure to check the package documentation for any updates or additional features: [async_wallpaper on pub.dev](https://pub.dev/packages/async_wallpaper).

By following these steps, you should be able to set a wallpaper in your Flutter app using the `async_wallpaper` package.


### ScreenShorts
<p>
  <img src='https://github.com/Meshva30/api_call/assets/136339359/579a4004-487c-47bf-8b81-279afcc66ee5' width=240>
  <img src='https://github.com/Meshva30/api_call/assets/136339359/996a2694-299a-4b1b-9c22-f53e13c3a013' width=240>


</p>

### Video


https://github.com/Meshva30/api_call/assets/136339359/35dfdd47-a60b-4b08-8e97-4d8c2a584440

## Pxabay API Calling

### 1. Set Up Your Flutter Project
If you haven't already set up a Flutter project, you can do so by running:
```bash
flutter create my_website
cd my_website
```

### 2. Add Dependencies
In your `pubspec.yaml` file, add the `http` package to handle HTTP requests:
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.14.0  # Check for the latest version on pub.dev
```
Then run `flutter pub get` to install the package.

### 3. Create a Service for API Calls
Create a new file `api_service.dart` in the `lib` directory to manage your API calls.

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> getData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> postData(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }
}
```

### 4. Integrate the Service into Your Flutter Widgets
You can now use this service in your Flutter widgets. Here's an example of a simple widget that fetches data from an API and displays it:

```dart
import 'package:flutter/material.dart';
import 'api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Calling',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService apiService = ApiService('https://api.example.com/');
  Future<Map<String, dynamic>>? _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = apiService.getData('/data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data Fetch'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data found');
            } else {
              final data = snapshot.data!;
              return Text('Data: ${data.toString()}');
            }
          },
        ),
      ),
    );
  }
}
```

### 5. Run Your Flutter App
You can now run your Flutter app using:
```bash
flutter run
```

This basic example sets up a Flutter project, adds the necessary dependencies, creates a service for making API calls, and integrates the service into a simple widget that fetches and displays data from an API. For a more advanced implementation, you can add error handling, loading indicators, and more complex data structures.

### ScreenShorts


<p>
  <img src='https://github.com/Meshva30/api_call/assets/136339359/ffff92e1-7e9d-40bf-bc08-465e6c944ec7' width=240>
  <img src='https://github.com/Meshva30/api_call/assets/136339359/2340a034-8be3-45a3-bcdf-3c6a3dcf0bb8' width=240>
  
</p>

### Video
https://github.com/Meshva30/api_call/assets/136339359/482719e8-56dc-4d6f-8067-fc327ff9cc00









