part of 'bag.dart';

class Styles {
  final Palette _palette;
  final TextTheme _textTheme;

  Styles._(
    ThemeData themeData,
    this._palette,
  ) : _textTheme = themeData.textTheme;

  //new text styles Bookshrink
  TextStyle get custom => TextStyle(
        color: _palette.primary,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      );
}
