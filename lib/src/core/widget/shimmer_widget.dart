import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/extensions/extensions.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.height = 100.0,
    this.width = .infinity,
    this.borderRadius = const .all(.circular(16)),
  });

  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    height: height,
    child: Shimmer.fromColors(
      baseColor: context.color.shimmer3,
      highlightColor: context.color.shimmer2,
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: borderRadius, color: context.color.shimmer1),
      ),
    ),
  );
}
