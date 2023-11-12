import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:shop_it/ui/common/design_system/styles.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Widget? titleWidget;
  final String? subTitle;
  final String? validatorText;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final Color? color;
  final bool isSelectable;

  const AppButton(
      {super.key,
      required this.title,
      this.titleWidget,
      this.disabled = false,
      this.busy = false,
      this.onTap,
      this.leading,
      this.isSelectable = false,
      this.color = kcPrimaryColor,
      this.subTitle,
      this.validatorText})
      : outline = false;

  const AppButton.outline(
      {super.key,
      required this.title,
      this.onTap,
      this.titleWidget,
      this.leading,
      this.color = kcPrimaryColor,
      this.subTitle,
      this.validatorText})
      : disabled = false,
        busy = false,
        isSelectable = false,
        outline = true;

  const AppButton.colored({
    super.key,
    required this.title,
    this.onTap,
    this.titleWidget,
    this.leading,
    this.busy = false,
    this.color = kcPrimaryColor,
    this.subTitle,
    this.validatorText,
  })  : disabled = false,
        isSelectable = false,
        outline = false;

  const AppButton.selectable({
    super.key,
    required this.title,
    this.onTap,
    this.titleWidget,
    this.leading,
    this.disabled = false,
    this.color = kcPrimaryColorGreen,
    this.subTitle,
    this.validatorText,
  })  : busy = false,
        isSelectable = true,
        outline = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isSelectable
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  selected: false,
                  dense: true,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Theme.of(context).textTheme.bodyMedium!.color!,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabled: !disabled,
                  selectedColor: Colors.red,
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  title: titleWidget ?? Text(title.toString()),
                  subtitle: subTitle != null
                      ? AppText.body(subTitle.toString())
                      : const SizedBox.shrink(),
                ),
                verticalSpaceSmall,
                validatorText != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: AppText.caption(
                          validatorText.toString(),
                          color: Theme.of(context).colorScheme.error,
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            )
          : AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              width: double.infinity,
              height: 48,
              alignment: Alignment.center,
              decoration: !outline
                  ? BoxDecoration(
                      color: !disabled
                          ? color ?? Theme.of(context).primaryColor
                          : kcMediumGreyColor,
                      borderRadius: BorderRadius.circular(8),
                    )
                  : BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: color ?? Theme.of(context).primaryColor,
                        width: 1,
                      )),
              child: !busy
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (leading != null) leading!,
                        if (leading != null) const SizedBox(width: 5),
                        Text(
                          title,
                          style: bodyStyle.copyWith(
                            fontWeight:
                                !outline ? FontWeight.bold : FontWeight.w400,
                            color: !outline
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
            ),
    );
  }
}
