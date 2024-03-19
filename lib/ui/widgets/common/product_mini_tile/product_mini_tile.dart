import 'package:cached_network_image/cached_network_image.dart';
import 'package:echelon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

import 'product_mini_tile_model.dart';

class ProductMiniTile extends StackedView<ProductMiniTileModel> {
  final Product product;

  const ProductMiniTile(this.product, {super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductMiniTileModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: 15.h,
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
            width: 10.h,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: product.image,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Gap(5.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  style: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 11.sp,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '\$${product.price}',
                    style: GoogleFonts.interTight(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProductMiniTileModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductMiniTileModel();
}
