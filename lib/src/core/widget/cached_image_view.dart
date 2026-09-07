import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';
import '../constant/gen/assets.gen.dart';
import 'shimmer_widget.dart';

class CachedImageView extends StatelessWidget {
  const CachedImageView({
    this.imageUrl,
    this.height = 100,
    this.width = .infinity,
    this.errorWidget,
    this.borderRadius,
    this.fit = .cover,
    this.httpHeaders,
    this.initials,
    super.key,
  });

  final double height;
  final double width;
  final String? imageUrl;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;
  final BoxFit fit;
  final String? initials;
  final Map<String, String>? httpHeaders;

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? .circular(4);
    final imageUrl = this.imageUrl?.trim();

    if (imageUrl == null || imageUrl.isEmpty) {
      return ClipRRect(
        borderRadius: borderRadius,
        clipBehavior: .hardEdge,
        child: SizedBox(
          width: width,
          height: height,
          child: ColoredBox(
            color: context.colors.primary,
            child: Center(
              child: FittedBox(
                fit: .scaleDown,
                child: Text(
                  (initials == null || initials!.trim().isEmpty) ? '—' : initials!.trim(),
                  style: context.textStyles.sfProDisplayW700s18.copyWith(color: context.colors.white, fontSize: 26),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: .hardEdge,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        httpHeaders: httpHeaders,
        alignment: .center,
        fit: fit,
        height: height,
        width: width,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            ShimmerWidget(borderRadius: .circular(4), width: width, height: height),
        errorWidget: (context, url, error) =>
            errorWidget ??
            SizedBox(
              width: width,
              height: height,
              child: ColoredBox(
                color: context.color.shimmer1,
                child: Assets.images.placeholder.image(fit: fit),
              ),
            ),
      ),
    );
  }
}
