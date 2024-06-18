import 'package:api_call/screen/wallpaper/componects/wallpaper.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';


import 'img_path.dart';

FloatingActionButton wallpaperButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () async {
      Imageset();
      showDialog(
        context: context,
        builder: (context)  {
          return AlertDialog(
            title: const Text('Are you set a Wallpaper'),
            actions: [
              TextButton(onPressed: () async {
                await setWallpaper(context, AsyncWallpaper.LOCK_SCREEN);
              }, child: const Text('Lock Screen')),
              TextButton(onPressed: () async {
                await setWallpaper(context, AsyncWallpaper.HOME_SCREEN);
              }, child: const Text('Home Screen')),
              TextButton(onPressed: () async {
                await setWallpaper(context, AsyncWallpaper.BOTH_SCREENS);
              }, child: const Text('Both Screen')),
              TextButton(onPressed: () async {
                Navigator.pop(context);
              }, child: const Text('Cancel')),
            ],
          );
        },
      );
    },
    child: const Icon(Icons.wallpaper),
  );
}