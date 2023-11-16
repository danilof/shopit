import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem(
      {super.key,
      required this.product,
      required this.onTapRemove,
      required this.onTapPlus,
      required this.onTapMinus});

  final CartProduct product;
  final void Function() onTapRemove;
  final void Function() onTapPlus;
  final void Function() onTapMinus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTapRemove,
            child: const SizedBox(
              width: 40,
              child: Icon(
                Icons.delete,
                color: kcMediumGreyColor,
              ),
            ),
          ),
          horizontalSpaceSmall,
          SizedBox(
            height: 100,
            width: 80,
            child: ExtendedImage.network(
              product.thumbnail,
              width: double.infinity,
              fit: BoxFit.cover,
              cache: true,
              loadStateChanged: (ExtendedImageState value) {
                if (value.extendedImageLoadState == LoadState.failed) {
                  return Center(
                      child: AppText.caption(
                          allTranslations.text("error_no_image").toString()));
                }
                return null;
              },
            ),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.body(product.title),
                AppText.body("${product.discountedPrice.ceil().toString()}€"),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onTapMinus,
                      child: const Icon(
                        Icons.remove_circle_outline_outlined,
                        size: 30,
                      ),
                    ),
                    horizontalSpaceSmall,
                    AppText.body(product.quantity.toString()),
                    horizontalSpaceSmall,
                    GestureDetector(
                      onTap: onTapPlus,
                      child: const Icon(
                        Icons.add_circle_outline_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
