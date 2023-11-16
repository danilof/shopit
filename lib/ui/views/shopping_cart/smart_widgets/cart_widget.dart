import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/widgets/empty_view.dart';
import 'package:shop_it/ui/views/shopping_cart/widgets/cart_product_item.dart';
import 'package:shop_it/ui/views/shopping_cart/widgets/cart_summary.dart';
import 'package:stacked/stacked.dart';

import 'cart_model.dart';

class CartWidget extends StackedView<CartModel> {
  const CartWidget({super.key});

  @override
  Widget builder(
    BuildContext context,
    CartModel viewModel,
    Widget? child,
  ) {
    return !viewModel.hasProducts
        ? EmptyView(
            title: allTranslations.text("cart_empty_title").toString(),
            description: allTranslations.text("cart_empty_desc").toString())
        : SizedBox(
            width: screenWidth(context),
            height: screenHeight(context),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0, top: 0),
                  child: ListView.builder(
                    key: UniqueKey(),
                    shrinkWrap: true,
                    itemCount: viewModel.cart!.products.length,
                    itemBuilder: (context, itemIndex) {
                      CartProduct item = viewModel.cart!.products[itemIndex];
                      return CartProductItem(
                        product: item,
                        onTapRemove: () => viewModel.removeFromCart(item.id),
                        onTapPlus: () => viewModel.plusQuantity(item.id),
                        onTapMinus: () => viewModel.minusQuantity(item.id),
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: CartSummary(
                      numOfProducts: viewModel.cart!.products.length,
                      total: viewModel.total,
                    ))
              ],
            ),
          );
  }

  @override
  void onViewModelReady(CartModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.initCart();
  }

  @override
  CartModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartModel();
}
