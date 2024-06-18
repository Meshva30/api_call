import 'package:api_call/screen/call_pixabay/call_pixabayScreen.dart';
import 'package:api_call/screen/call_pixabay/provider/callpixabay_provider.dart';
import 'package:api_call/screen/post_apicall/post_api_call.dart';
import 'package:api_call/screen/post_apicall/provider/post_provider.dart';
import 'package:api_call/screen/user_api_call/provider/user_Provider.dart';
import 'package:api_call/screen/wallpaper/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PostApiProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserApiProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      ),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WallpaperScreen(),
    );
  }
}
