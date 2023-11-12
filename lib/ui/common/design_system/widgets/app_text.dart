import 'package:flutter/material.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:shop_it/ui/common/design_system/styles.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Widget? icon;
  final TextOverflow? textOverflow;

  AppText.headingOne(this.text,
      {super.key,
      Color color = kcMediumGreyColor,
      this.icon,
      this.textOverflow})
      : style = heading1Style.copyWith(color: color);
  AppText.headingTwo(this.text,
      {super.key,
      Color color = kcMediumGreyColor,
      this.icon,
      this.textOverflow})
      : style = heading2Style.copyWith(color: color);
  AppText.headingThree(this.text,
      {super.key,
      Color color = kcMediumGreyColor,
      this.icon,
      this.textOverflow})
      : style = heading3Style.copyWith(color: color);
  AppText.headline(this.text,
      {super.key,
      Color color = kcMediumGreyColor,
      this.icon,
      this.textOverflow})
      : style = headlineStyle.copyWith(color: color);
  AppText.subheading(this.text,
      {super.key,
      Color color = kcMediumGreyColor,
      this.icon,
      this.textOverflow})
      : style = subheadingStyle.copyWith(color: color);
  AppText.caption(this.text,
      {super.key,
      Color color = kcMediumGreyColor,
      this.icon,
      this.textOverflow})
      : style = captionStyle.copyWith(color: color);

  AppText.body(this.text,
      {super.key,
      Color color = kcMediumGreyColor,
      this.icon,
      this.textOverflow})
      : style = bodyStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? Semantics(
            label: text,
            child: Text(
              text,
              style: style,
              overflow: (textOverflow == null) ? TextOverflow.ellipsis : null,
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 10),
            child: Row(
              children: [
                SizedBox(child: icon!),
                horizontalSpaceSmall,
                Text(
                  text,
                  style: style,
                  overflow:
                      (textOverflow == null) ? TextOverflow.ellipsis : null,
                )
              ],
            ),
          );
  }
}
