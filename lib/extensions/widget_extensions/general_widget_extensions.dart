import 'package:flutter/material.dart';

extension FlGeneralWidgetExtension on Widget {
  Widget onClick(Function onClickListener) {
    return GestureDetector(
      onTap: () {
        onClickListener();
      },
      child: this,
    );
  }
}
