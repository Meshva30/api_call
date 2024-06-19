import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

import 'img_path.dart';



Future<void> setWallpaper(BuildContext context, int wallpaperLocation) async {
  if (fileImg == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("No image available for setting wallpaper")),
    );
    return;
  }

  try {
    await AsyncWallpaper.setWallpaperFromFile(
      filePath: fileImg!.path,
      wallpaperLocation: wallpaperLocation,
      goToHome: false,
      toastDetails: ToastDetails.success(),
      errorToastDetails: ToastDetails.error(),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Wallpaper set successfully")),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error setting wallpaper: ${e.toString()}")),
    );
  }
}