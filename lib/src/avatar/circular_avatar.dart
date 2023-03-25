import 'package:flutter/material.dart';

class FlCircularAvatar extends StatelessWidget {
  ///Radius of the circular avatar, default [radius] is 64
  final double radius;

  ///Path of asset [placeholder] image
  final String placeHolder;

  ///Avatar network [imageUrl]
  final String imageUrl;

  ///Load circular avatar using network url
  const FlCircularAvatar(
      {Key? key,
      this.radius = 64,
      required this.imageUrl,
      required this.placeHolder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: FadeInImage.assetNetwork(
        width: radius,
        height: radius,
        placeholder: placeHolder,
        image: imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
