import 'package:flutter/material.dart';

class ClippedImage extends StatelessWidget {
  final Image heroPreviewImage;

  final String heroName;

  ClippedImage({required this.heroPreviewImage, required this.heroName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          heroPreviewImage,
          Text(heroName),
        ],
      ),
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 0, 100);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}
