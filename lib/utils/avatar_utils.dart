class AvatarUtils {
  static double getStatusPadding(double avatarSize, double statusSize) {
    var padding =
        ((avatarSize / 2 * 0.41 * 2 / 1.41 / 2).abs() - (statusSize / 2));
    if (padding.isNegative) {
      return 0;
    } else {
      return padding;
    }
  }
}
