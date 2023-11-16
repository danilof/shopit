import 'package:flutter/material.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';
import 'package:shop_it/ui/common/smart_widgets/cart_badge_model.dart';
import 'package:stacked/stacked.dart';

class CartBadge extends StackedView<CartBadgeModel> {
  const CartBadge({super.key});

  @override
  Widget builder(
    BuildContext context,
    CartBadgeModel viewModel,
    Widget? child,
  ) {
    return viewModel.numOf == 0
        ? const SizedBox.shrink()
        : ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 15,
              color: Colors.red,
              child: Center(
                child: AppText.caption(
                  viewModel.numOf.toString(),
                  color: Colors.white,
                ),
              ),
            ),
          );
  }

  @override
  CartBadgeModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartBadgeModel();
}
