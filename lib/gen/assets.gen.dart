/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/bg_sound.mp3
  String get bgSound => 'assets/audio/bg_sound.mp3';

  /// File path: assets/audio/tap_o_sound.mp3
  String get tapOSound => 'assets/audio/tap_o_sound.mp3';

  /// File path: assets/audio/tap_sound.mp3
  String get tapSound => 'assets/audio/tap_sound.mp3';

  /// File path: assets/audio/tap_x_sound.mp3
  String get tapXSound => 'assets/audio/tap_x_sound.mp3';

  /// List of all assets
  List<String> get values => [bgSound, tapOSound, tapSound, tapXSound];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/png
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/dark_logo.png
  AssetGenImage get darkLogo =>
      const AssetGenImage('assets/images/png/dark_logo.png');

  /// File path: assets/images/png/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/images/png/facebook.png');

  /// File path: assets/images/png/google.png
  AssetGenImage get google =>
      const AssetGenImage('assets/images/png/google.png');

  /// File path: assets/images/png/idea.png
  AssetGenImage get idea => const AssetGenImage('assets/images/png/idea.png');

  /// File path: assets/images/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/png/logo.png');

  /// File path: assets/images/png/moon.png
  AssetGenImage get moon => const AssetGenImage('assets/images/png/moon.png');

  /// File path: assets/images/png/robot.png
  AssetGenImage get robot => const AssetGenImage('assets/images/png/robot.png');

  /// File path: assets/images/png/sun.png
  AssetGenImage get sun => const AssetGenImage('assets/images/png/sun.png');

  /// File path: assets/images/png/swords_1.png
  AssetGenImage get swords1 =>
      const AssetGenImage('assets/images/png/swords_1.png');

  /// File path: assets/images/png/winner_1.png
  AssetGenImage get winner1 =>
      const AssetGenImage('assets/images/png/winner_1.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        darkLogo,
        facebook,
        google,
        idea,
        logo,
        moon,
        robot,
        sun,
        swords1,
        winner1
      ];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
