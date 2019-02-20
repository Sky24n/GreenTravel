import 'package:flutter/widgets.dart';
import 'package:green_travel_a/res/index.dart';

class TextStyles {
  static const TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.text_dark,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle listContent = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_normal,
  );
  static const TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray,
  );
  static const TextStyle appTitle = TextStyle(
    fontSize: Dimens.font_sp18,
    color: Colours.text_dark,
  );
}

class Decorations {
  static const Decoration bottom = BoxDecoration(
      border: Border(
          bottom:
              BorderSide(width: Dimens.border_width, color: Colours.divider)));
}

class Gaps {
  static Widget hGap3 = new SizedBox(width: Dimens.gap_dp3);
  static Widget hGap5 = new SizedBox(width: Dimens.gap_dp5);
  static Widget hGap10 = new SizedBox(width: Dimens.gap_dp10);
  static Widget hGap15 = new SizedBox(width: Dimens.gap_dp15);

  static Widget vGap5 = new SizedBox(height: Dimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: Dimens.gap_dp10);
  static Widget vGap15 = new SizedBox(height: Dimens.gap_dp15);
}
