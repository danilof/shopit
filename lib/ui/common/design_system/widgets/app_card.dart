import 'package:flutter/material.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final bool showBorder;
  const AppCard({super.key, required this.child, this.showBorder = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: (showBorder)
          ? RoundedRectangleBorder(
              side: const BorderSide(color: kcMediumGreyColor, width: 0),
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      elevation: 0,
      child: child,
    );
  }
}
