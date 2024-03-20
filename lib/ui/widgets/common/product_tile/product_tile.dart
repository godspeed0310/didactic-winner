import 'package:cached_network_image/cached_network_image.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/ui/common/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

import 'product_tile_model.dart';

class ProductTile extends StackedView<ProductTileModel> {
  final Product product;

  const ProductTile(this.product, {super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductTileModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: 60.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: viewModel.favouriteListenable,
            builder: (_, value, __) {
              final isFavourite = value.values.contains(product);

              return Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: isFavourite ? context.primaryColor : Colors.black,
                  ),
                  onPressed: () => viewModel.manageFavourite(product),
                ),
              );
            },
          ),
          CachedNetworkImage(
            imageUrl: product.image,
            height: 20.h,
            width: 20.h,
          ),
          Gap(2.h),
          Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.interTight(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
          Gap(1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$${product.price}',
                style: GoogleFonts.interTight(
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              RatingStars(
                valueLabelVisibility: false,
                value: product.rating.rate,
                starSize: 3.w,
              ),
              Gap(2.w),
              Text(
                '(${product.rating.count})',
                style: GoogleFonts.interTight(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          ValueListenableBuilder(
            valueListenable: viewModel.cartListenable,
            builder: (_, value, __) {
              bool inCart = value.values.contains(product);
              return ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(50.w),
                  ),
                ),
                onPressed: () => viewModel.manageCart(product),
                child: Text(inCart ? 'Added to cart' : 'Add to cart'),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  ProductTileModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductTileModel();
}
