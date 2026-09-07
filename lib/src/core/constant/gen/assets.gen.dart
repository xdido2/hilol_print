// dart format width=120

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $ConfigGen {
  const $ConfigGen();

  /// File path: config/development.json
  String get development => 'config/development.json';

  /// File path: config/production.json
  String get production => 'config/production.json';

  /// File path: config/staging.json
  String get staging => 'config/staging.json';

  /// List of all assets
  List<String> get values => [development, production, staging];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon_chevron_right.svg
  SvgGenImage get iconChevronRight => const SvgGenImage('assets/icons/icon_chevron_right.svg');

  /// File path: assets/icons/icon_cursor.svg
  SvgGenImage get iconCursor => const SvgGenImage('assets/icons/icon_cursor.svg');

  /// File path: assets/icons/icon_delete.svg
  SvgGenImage get iconDelete => const SvgGenImage('assets/icons/icon_delete.svg');

  /// File path: assets/icons/icon_exit.svg
  SvgGenImage get iconExit => const SvgGenImage('assets/icons/icon_exit.svg');

  /// File path: assets/icons/icon_file.svg
  SvgGenImage get iconFile => const SvgGenImage('assets/icons/icon_file.svg');

  /// File path: assets/icons/icon_file_export.svg
  SvgGenImage get iconFileExport => const SvgGenImage('assets/icons/icon_file_export.svg');

  /// File path: assets/icons/icon_gallery.svg
  SvgGenImage get iconGallery => const SvgGenImage('assets/icons/icon_gallery.svg');

  /// File path: assets/icons/icon_settings.svg
  SvgGenImage get iconSettings => const SvgGenImage('assets/icons/icon_settings.svg');

  /// File path: assets/icons/icon_sos.svg
  SvgGenImage get iconSos => const SvgGenImage('assets/icons/icon_sos.svg');

  /// File path: assets/icons/sort.svg
  SvgGenImage get sort => const SvgGenImage('assets/icons/sort.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    iconChevronRight,
    iconCursor,
    iconDelete,
    iconExit,
    iconFile,
    iconFileExport,
    iconGallery,
    iconSettings,
    iconSos,
    sort,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/file.png
  AssetGenImage get file => const AssetGenImage('assets/images/file.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/img_message.png
  AssetGenImage get imgMessage => const AssetGenImage('assets/images/img_message.png');

  /// File path: assets/images/journal.png
  AssetGenImage get journal => const AssetGenImage('assets/images/journal.png');

  /// File path: assets/images/journal_parent_done.png
  AssetGenImage get journalParentDone => const AssetGenImage('assets/images/journal_parent_done.png');

  /// File path: assets/images/journal_parnet_action.png
  AssetGenImage get journalParnetAction => const AssetGenImage('assets/images/journal_parnet_action.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/message.png
  AssetGenImage get message => const AssetGenImage('assets/images/message.png');

  /// File path: assets/images/placeholder.jpg
  AssetGenImage get placeholder => const AssetGenImage('assets/images/placeholder.jpg');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/stretch.png
  AssetGenImage get stretch => const AssetGenImage('assets/images/stretch.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appLogo,
    file,
    home,
    imgMessage,
    journal,
    journalParentDone,
    journalParnetAction,
    logo,
    message,
    placeholder,
    profile,
    stretch,
  ];
}

class $AssetsVectorsGen {
  const $AssetsVectorsGen();

  /// File path: assets/vectors/icon_chevron_right.vec
  SvgGenImage get iconChevronRight => const SvgGenImage.vec('assets/vectors/icon_chevron_right.vec');

  /// File path: assets/vectors/icon_cursor.vec
  SvgGenImage get iconCursor => const SvgGenImage.vec('assets/vectors/icon_cursor.vec');

  /// File path: assets/vectors/icon_delete.vec
  SvgGenImage get iconDelete => const SvgGenImage.vec('assets/vectors/icon_delete.vec');

  /// File path: assets/vectors/icon_exit.vec
  SvgGenImage get iconExit => const SvgGenImage.vec('assets/vectors/icon_exit.vec');

  /// File path: assets/vectors/icon_file.vec
  SvgGenImage get iconFile => const SvgGenImage.vec('assets/vectors/icon_file.vec');

  /// File path: assets/vectors/icon_file_export.vec
  SvgGenImage get iconFileExport => const SvgGenImage.vec('assets/vectors/icon_file_export.vec');

  /// File path: assets/vectors/icon_gallery.vec
  SvgGenImage get iconGallery => const SvgGenImage.vec('assets/vectors/icon_gallery.vec');

  /// File path: assets/vectors/icon_settings.vec
  SvgGenImage get iconSettings => const SvgGenImage.vec('assets/vectors/icon_settings.vec');

  /// File path: assets/vectors/icon_sos.vec
  SvgGenImage get iconSos => const SvgGenImage.vec('assets/vectors/icon_sos.vec');

  /// File path: assets/vectors/sort.vec
  SvgGenImage get sort => const SvgGenImage.vec('assets/vectors/sort.vec');

  /// List of all assets
  List<SvgGenImage> get values => [
    iconChevronRight,
    iconCursor,
    iconDelete,
    iconExit,
    iconFile,
    iconFileExport,
    iconGallery,
    iconSettings,
    iconSos,
    sort,
  ];
}

abstract final class Assets {
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVectorsGen vectors = $AssetsVectorsGen();
  static const $ConfigGen config = $ConfigGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}, this.animation});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({required this.isAnimation, required this.duration, required this.frames});

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package);
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
