import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:logger/logger.dart';

class FullScreenImage extends StatelessWidget {

  final logger = Logger();

  final String imageUrl;

  FullScreenImage({super.key,
  required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),

      backgroundColor: Colors.black,

      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        itemCount: 1,
        backgroundDecoration: const BoxDecoration(
          color: Colors.black
        ),
        pageController: PageController(),
        onPageChanged: (index) {
          logger.i("Change to page $index");
        },
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageUrl),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.contained * 3);
        },

      )
    );
  }
}