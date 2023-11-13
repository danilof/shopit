import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';
import 'package:shop_it/ui/common/design_system/widgets/loading_indicator.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/logo.svg",
                width: 100,
                colorFilter: const ColorFilter.mode(
                    kcPrimaryColorGreen, BlendMode.srcIn)),
            AppText.headingOne(
                allTranslations.text("label_app_name").toString()),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.body(allTranslations.text("label_loading").toString()),
                horizontalSpaceSmall,
                const SizedBox(
                    width: 16, height: 16, child: AppLoadingIndicator())
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
