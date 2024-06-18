import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'componects/img_path.dart';
import 'componects/wallpaper_button.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper App'),
      ),
      body: RepaintBoundary(
        key: imgKey,
        child: CarouselSlider(
          items: List.generate(
            5,
                (index) {
              return SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/img/img${index + 1}.jpg',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          options: CarouselOptions(
            height: 715,
            aspectRatio: 16 / 4,
            viewportFraction: 1.2,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
      floatingActionButton: wallpaperButton(context),
    );
  }
}