import 'package:cached_network_image/cached_network_image.dart';
import 'package:echelon/models/product.dart';
import 'package:flutter/material.dart';
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
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$${product.price}',
                style: GoogleFonts.interTight(
                  color: Colors.black,
                ),
              ),
            ],
          )
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
