import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangle({
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circle({
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height,
          width: width,
          decoration: ShapeDecoration(
            shape: shapeBorder,
            color: const Color.fromARGB(255, 237, 237, 237),
          ),
        ),
      );
}
