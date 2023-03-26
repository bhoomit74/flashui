import 'package:flashui/utils/avatar_utils.dart';
import 'package:flutter/material.dart';

class FlCircularAvatarWithStatus extends StatelessWidget {
  ///Radius of the circular avatar, default [size] is 64
  final double size;

  ///Path of asset [placeholder] image
  final String placeHolder;

  ///Avatar network [imageUrl]
  final String imageUrl;

  //Icon shown in status
  final Widget? statusIcon;

  ///Size of status icon, default [statusIconSize] is 16
  final double statusSize;

  ///Status color for icon
  final Color statusBackgroundColor;

  ///default color is white,You can pass transparent color to hide border.
  final Color statusBorderColor;

  ///Load circular avatar using network url
  const FlCircularAvatarWithStatus(
      {Key? key,
      this.size = 64,
      required this.imageUrl,
      required this.placeHolder,
      this.statusIcon,
      required this.statusBackgroundColor,
      this.statusBorderColor = Colors.white,
      this.statusSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.bottomRight,
        children: [
          ClipOval(
            child: FadeInImage.assetNetwork(
              placeholder: placeHolder,
              image: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                width: statusSize,
                height: statusSize,
                margin: EdgeInsets.only(
                    bottom: AvatarUtils.getStatusPadding(size, statusSize),
                    right: AvatarUtils.getStatusPadding(size, statusSize)),
                decoration: BoxDecoration(
                    border: Border.all(color: statusBorderColor, width: 1),
                    shape: BoxShape.circle,
                    color: statusBackgroundColor),
                child: Center(child: statusIcon)),
          ),
        ],
      ),
    );
  }
}
