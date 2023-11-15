import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.product,
      required this.onTap,
      this.isList = false,
      required this.onAddToCart});

  final bool isList;
  final Product product;
  final void Function() onTap;
  final void Function() onAddToCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, top: 12),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 140,
                  child: ExtendedImage.network(
                    product.thumbnail,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    cache: true,
                    loadStateChanged: (ExtendedImageState value) {
                      if (value.extendedImageLoadState == LoadState.failed) {
                        return Center(
                            child: AppText.caption(allTranslations
                                .text("error_no_image")
                                .toString()));
                      }
                      return null;
                    },
                  ),
                ),
                isList ? verticalSpaceSmall : verticalSpaceTiny,
                AppText.body(product.title),
                isList
                    ? AppText.caption(
                        product.description,
                      )
                    : const SizedBox.shrink(),
                verticalSpaceSmall,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText.body(
                      "${(product.price - product.price * (product.discountPercentage / 100)).ceil().toString()}€",
                      textOverflow: TextOverflow.visible,
                    ),
                    horizontalSpaceTiny,
                    AppText.styled(
                      "${product.price.toString()}€",
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough, fontSize: 12),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: onAddToCart,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.shopping_cart_checkout,
                          size: 22,
                        ),
                      ),
                    )
                  ],
                ),
                AppText.caption(
                  allTranslations.text("label_in_stock").toString(),
                  color: kcPrimaryColorGreen,
                )
              ],
            ),
            Container(
              decoration: _getSaleDecoration(context),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AppText.caption(
                  "-${product.discountPercentage.ceil().toString()}%",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _getSaleDecoration(BuildContext context,
          {double? borderRadius = 0.0}) =>
      BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? 0.0),
          topRight: Radius.zero,
          bottomRight: const Radius.circular(8),
          bottomLeft: Radius.zero,
        ),
      );
}
