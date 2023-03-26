import 'package:flashui/extensions/widget_extensions/general_widget_extensions.dart';
import 'package:flutter/material.dart';

class FlRoundedAvatar extends StatelessWidget {
  ///Width of the avatar, default [width] is 64
  final double width;

  //height of the avatar, default [height] is 64
  final double height;

  ///Path of asset [placeholder] image
  final String placeHolder;

  ///Avatar network [imageUrl]
  final String imageUrl;

  //default radius is 8
  final double borderRadius;

  final Function()? onAvatarClick;

  ///Load Rounded border avatar from network url
  const FlRoundedAvatar(
      {Key? key,
      this.width = 64,
      this.height = 64,
      required this.imageUrl,
      required this.placeHolder,
      this.borderRadius = 8,
      this.onAvatarClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: FadeInImage.assetNetwork(
        width: width,
        height: height,
        placeholder: placeHolder,
        image: imageUrl,
        fit: BoxFit.cover,
      ),
    ).onClick(() {
      onAvatarClick?.call();
    });
  }
}
