import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  /// The height of the vertical space.
  final double height;
  const VerticalSpace(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HorizontalSpace extends StatelessWidget {
  /// The width of the horizontal space.
  final double width;
  const HorizontalSpace(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
