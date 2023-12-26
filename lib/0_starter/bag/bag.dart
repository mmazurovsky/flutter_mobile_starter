import 'package:flutter/material.dart';

import '../data/entities/failures.dart';
import '../data/entities/graphics.dart';

part 'assets.dart';
part 'device.dart';
part 'palette.dart';
part 'spaces.dart';
part 'strings.dart';
part 'styles.dart';
part 'theme.dart';

class Bag {
  const Bag._();

  static late Assets _assets;
  static late Device _device;
  static late Palette _palette;
  static late Spaces _spaces;
  static late Styles _styles;
  static late Strings _strings;
  static late ThemeData _themeData;

  /// will be called second
  static void init({
    required MediaQueryData mediaQuery,
    required ThemeData initialThemeData,
  }) {
    _device = Device._(
      screenSize: mediaQuery.size,
      orientation: mediaQuery.orientation,
    );
    _spaces = Spaces._(
      device: device,
    );
    _themeData = _createThemeData(
      initialThemeData.brightness,
      palette,
    );
    _assets = Assets._();
    _palette = Palette._(_themeData.brightness);
    _styles = Styles._(
      _themeData,
      _palette,
    );
    _strings = Strings._();
  }

  static Assets get assets => _assets;

  static Palette get palette => _palette;

  static Spaces get spaces => _spaces;

  static Strings get strings => _strings;

  static Styles get styles => _styles;

  static Device get device => _device;

  static ThemeData get themeData => _themeData;
}
