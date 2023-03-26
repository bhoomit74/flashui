import 'package:collection/collection.dart';
import 'package:flashui/flashui.dart';
import 'package:flutter/material.dart';

import '../../utils/string_constants.dart';

class FlAvatarStack extends StatelessWidget {
  ///List of avatar urls to include in stack.
  final List<String> avatarUrls;

  ///On particular avatar click, return data for that avatar.
  final List<dynamic>? avatarsData;

  ///Asset path of placeholder image
  final String placeHolder;

  ///Size of avatar item
  final double avatarSize;

  ///Default border color is white and width 2.
  final Border? avatarBorder;

  final Function(dynamic data)? onAvatarClick;

  ///Avatar overlap value in stack, value is from 0 to 1, 0 means completely overlap, 1 means not overlapping, 0.50 means half overlap.
  ///The default value is 0.70
  final double overlap;

  ///Max avatar to shown, not passing any value will show all the avatars
  final int? maxLengthToShown;

  ///Stack of avatars
  const FlAvatarStack(
      {Key? key,
      required this.avatarUrls,
      this.avatarsData,
      required this.placeHolder,
      this.avatarSize = 64,
      this.avatarBorder,
      this.overlap = 0.70,
      this.onAvatarClick,
      this.maxLengthToShown})
      : assert(avatarsData == null || avatarsData.length == avatarUrls.length,
            AppStrings.avatarStackUrlsAndDataLengthNotMatching),
        assert(
            maxLengthToShown == null || maxLengthToShown <= avatarUrls.length,
            AppStrings.avatarStackMaxLengthToShownIsNotValid),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: avatarSize,
      child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.topLeft,
          children: avatarUrls
              .sublist(0, maxLengthToShown ?? avatarUrls.length)
              .reversed
              .mapIndexed((index, avatarUrl) => Positioned(
                    left:
                        ((maxLengthToShown ?? avatarUrls.length) - index - 1) *
                            avatarSize *
                            overlap,
                    child: FlCircularAvatar(
                      imageUrl: avatarUrl,
                      size: avatarSize,
                      placeHolder: placeHolder,
                      border: avatarBorder ??
                          Border.all(color: Colors.white, width: 2),
                      onAvatarClick: () {
                        onAvatarClick?.call(avatarsData?[index]);
                      },
                    ),
                  ))
              .toList()),
    );
  }
}
