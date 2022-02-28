import 'package:flutter/material.dart';

class ClippedImage extends StatelessWidget {
  final String imageUrl;

  final String heroName;

  final double width;

  const ClippedImage({
    Key? key,
    required this.imageUrl,
    required this.heroName,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Align(
        heightFactor: 0.5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fitWidth,
                height: 180,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Text(
              heroName,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
