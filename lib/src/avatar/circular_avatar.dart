import 'package:flashui/extensions/widget_extensions/general_widget_extensions.dart';
import 'package:flutter/material.dart';

class FlCircularAvatar extends StatelessWidget {
  ///Size of the circular avatar, default [size] is 64
  final double size;

  ///Path of asset [placeholder] image
  final String placeHolder;

  ///Avatar network [imageUrl]
  final String imageUrl;

  ///You can add border, by default there is no border
  final Border? border;

  ///You can add space between border and avatar using [boarderPadding], default padding is 0.
  final double borderPadding;

  final Function()? onAvatarClick;

  ///Load circular avatar using network url
  const FlCircularAvatar(
      {Key? key,
      this.size = 64,
      required this.imageUrl,
      required this.placeHolder,
      this.border,
      this.borderPadding = 0,
      this.onAvatarClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(borderPadding),
      decoration: BoxDecoration(shape: BoxShape.circle, border: border),
      child: ClipOval(
        child: FadeInImage.assetNetwork(
          placeholder: placeHolder,
          image: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    ).onClick(() {
      onAvatarClick?.call();
    });
  }
}
