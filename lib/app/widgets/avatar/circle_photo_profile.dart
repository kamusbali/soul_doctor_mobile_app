import 'package:flutter/material.dart';

class CirclePhotoProfile extends StatelessWidget {
  const CirclePhotoProfile({
    super.key,
    this.width,
    this.height,
    required this.image,
  });
  final double? width;
  final double? height;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        image: DecorationImage(image: image, fit: BoxFit.fill),
      ),
    );
  }
}
