import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';

Future<void> Imageset() async {
  try {
    final boundary =
        imgKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();

    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception("Failed to convert image to byte data");
    }

    final imgData = byteData.buffer.asUint8List();

    final directory = await getApplicationDocumentsDirectory();

    fileImg = File(
        "${directory.path}/flutter/${DateTime.now().millisecondsSinceEpoch}.png");

    fileImg!.createSync(recursive: true);
    fileImg!.writeAsBytesSync(imgData);
  } catch (e) {
    print("Error saving image: ${e.toString()}");

  }
}

GlobalKey imgKey = GlobalKey();

File? fileImg;
