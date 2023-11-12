import 'package:flutter/material.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: kcLightGreyColor,
      strokeWidth: 4,
    );
  }
}
