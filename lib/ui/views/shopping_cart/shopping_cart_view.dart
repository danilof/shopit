import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_button.dart';
import 'package:shop_it/ui/views/shopping_cart/smart_widgets/cart_widget.dart';
import 'package:stacked/stacked.dart';

import 'shopping_cart_viewmodel.dart';

class ShoppingCartView extends StackedView<ShoppingCartViewModel> {
  const ShoppingCartView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ShoppingCartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(allTranslations.text("title_my_cart").toString()),
            SizedBox(
              width: 150,
              child: AppButton.colored(
                onTap: viewModel.checkOut,
                leading: const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                ),
                title: allTranslations.text("action_checkout").toString(),
                color: kcPrimaryColorGreen,
              ),
            )
          ],
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: CartWidget(),
        ),
      ),
    );
  }

  @override
  ShoppingCartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShoppingCartViewModel();
}
