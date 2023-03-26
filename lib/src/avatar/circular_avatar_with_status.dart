import 'package:flashui/extensions/widget_extensions/general_widget_extensions.dart';
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

  final double statusBorderWidth;

  final dynamic data;

  final Function? onAvatarClick;

  final Function? onStatusClick;

  ///Load circular avatar using network url
  const FlCircularAvatarWithStatus(
      {Key? key,
      this.size = 64,
      required this.imageUrl,
      required this.placeHolder,
      this.statusIcon,
      required this.statusBackgroundColor,
      this.statusBorderColor = Colors.white,
      this.statusBorderWidth = 2,
      this.statusSize = 16,
      this.data,
      this.onAvatarClick,
      this.onStatusClick})
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
          if (onAvatarClick != null) ...[
            Positioned.fill(
                child: ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white24,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    onAvatarClick?.call(data);
                  },
                ),
              ),
            ))
          ],
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                    width: statusSize,
                    height: statusSize,
                    margin: EdgeInsets.only(
                        bottom: AvatarUtils.getStatusPadding(size, statusSize),
                        right: AvatarUtils.getStatusPadding(size, statusSize)),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: statusBorderColor, width: statusBorderWidth),
                        shape: BoxShape.circle,
                        color: statusBackgroundColor),
                    child: Center(child: statusIcon))
                .onClick(() {
              onStatusClick?.call();
            }),
          ),
        ],
      ),
    );
  }
}
