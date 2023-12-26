part of 'bag.dart';

class Palette {
  final Brightness brightness;
  Palette._(this.brightness);

  // Colors as they are
  static const _white = Color(0xffffffff);
  static const _black = Color(0x00000000);
  static const _purple = Colors.purple;

  // Colors that are used in widgets
  Color get background => _white;

  Color get primary => _black;

  Color get accent => _purple;

  Color get divider => _black;
}
