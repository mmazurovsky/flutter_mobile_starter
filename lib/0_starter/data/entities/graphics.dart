class SvgAssetGraphic {
  final String path;
  final String name;

  const SvgAssetGraphic({
    required this.name,
  }) : path = 'assets/graphics/$name.svg';
}

class SvgAssetIcon {
  final String path;
  final String name;

  const SvgAssetIcon({
    required this.name,
  }) : path = 'assets/icons/$name.svg';
}
