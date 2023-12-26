part of 'bag.dart';

class Assets {
  final Icons _icons;
  final Graphics _graphics;

  Assets._()
      : _icons = const Icons._(),
        _graphics = const Graphics._();

  Icons get icons => _icons;

  Graphics get graphics => _graphics;
}

class Graphics {
  const Graphics._();

  SvgAssetGraphic get custom => const SvgAssetGraphic(name: 'custom');
}

class Icons {
  const Icons._();

  SvgAssetIcon get custom => const SvgAssetIcon(name: 'custom');
}
