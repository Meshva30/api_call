import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';



Future<void> Imageset() async {
  try {
    // Obtain the boundary and create an image
    final boundary = imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();

    // Convert the image to byte data
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception("Failed to convert image to byte data");
    }

    // Convert byte data to Uint8List
    final imgData = byteData.buffer.asUint8List();

    // Get the application documents directory
    final directory = await getApplicationDocumentsDirectory();

    // Create a file path for the image
    fileImg = File("${directory.path}/flutter/${DateTime.now().millisecondsSinceEpoch}.png");

    // Create the file and write the image data
    fileImg!.createSync(recursive: true);
    fileImg!.writeAsBytesSync(imgData);
  } catch (e) {
    print("Error saving image: ${e.toString()}");
    // Handle the error appropriately, e.g., by showing a snackbar or dialog
  }
}

GlobalKey imgKey = GlobalKey();

File? fileImg;