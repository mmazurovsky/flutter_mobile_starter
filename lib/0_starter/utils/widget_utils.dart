import 'package:flutter/material.dart';

extension ListWithSeparators<DATAELEMENT> on List<DATAELEMENT> {
  Iterable<Widget> mapSeparated(
    Widget Function(DATAELEMENT e) widgetBuilder, {
    required Widget separator,
  }) {
    return asMap().entries.map((e) {
      if (e.key == length - 1) {
        final widget = widgetBuilder(e.value);
        return widget;
      } else {
        final widget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgetBuilder(e.value),
            separator,
          ],
        );
        return widget;
      }
    });
  }
}
