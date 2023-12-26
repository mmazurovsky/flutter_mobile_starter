part of 'bag.dart';

//TODO: not sure how to handle initial theme change
ThemeData _createThemeData(
  Brightness brightness,
  Palette palette,
) {
  final colorScheme = brightness == Brightness.light
      ? const ColorScheme.light()
      : const ColorScheme.dark().copyWith(
          onSurface: palette.background,
          onBackground: palette.background,
        );
  return ThemeData(
    // fontFamily: 'NotoSans',
    useMaterial3: true,
    brightness: brightness,
    colorScheme: colorScheme.copyWith(
      primary: palette.primary,
      secondary: palette.accent,
      background: palette.background,
    ),
    splashFactory: NoSplash.splashFactory,
    dialogBackgroundColor: palette.background,
    scaffoldBackgroundColor: palette.background,
    dividerColor: palette.divider,
  );
}
