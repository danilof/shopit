import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';

class ProductImageGallery extends StatelessWidget {
  final List<String> images;

  const ProductImageGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int itemIndex, int itemRealIndex) {
        return ExtendedImage.network(
          images[itemIndex],
          width: double.infinity,
          fit: BoxFit.fitHeight,
          //maxBytes: 500000,
          cache: true,
          loadStateChanged: (ExtendedImageState value) {
            if (value.extendedImageLoadState == LoadState.failed) {
              return Center(
                  child: AppText.body(
                      allTranslations.text("error_image").toString()));
            }
            return null;
          },
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: false,
        autoPlay: true,
        viewportFraction: 1,
        height: screenHeight(context),
        enableInfiniteScroll: false,
      ),
    );
  }
}
