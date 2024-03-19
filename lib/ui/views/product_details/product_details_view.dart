import 'package:action_slider/action_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/ui/common/app_extensions.dart';
import 'package:echelon/ui/widgets/common/default_system_overlay/default_system_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

import 'product_details_viewmodel.dart';

class ProductDetailsView extends StackedView<ProductDetailsViewModel> {
  final Product product;

  const ProductDetailsView(this.product, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductDetailsViewModel viewModel,
    Widget? child,
  ) {
    return DefaultSystemOverlay(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      scaffold: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(product.title),
          titleTextStyle: GoogleFonts.interTight(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: product.image,
                width: 60.w,
                height: 60.w,
                fit: BoxFit.contain,
              ).animate().scale(),
              Gap(2.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: GoogleFonts.interTight(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ).animate().slideX(
                      delay: 150.ms, begin: -1.3, end: 0, duration: 300.ms),
                  Gap(2.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 2.w,
                    ),
                    decoration: ShapeDecoration(
                      shape: const StadiumBorder(),
                      color: context.primaryColor,
                    ),
                    child: Text(
                      '\$${product.price}',
                      style: GoogleFonts.interTight(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ).animate().slideX(
                      delay: 300.ms, begin: -1.3, end: 0, duration: 300.ms),
                  Gap(3.h),
                  Text(
                    product.description,
                    style: GoogleFonts.interTight(
                      color: Colors.black,
                    ),
                  ).animate().slideX(delay: 450.ms, begin: -1.3, end: 0),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 10.h,
          child: Center(
            child: ActionSlider.custom(
              sliderBehavior: SliderBehavior.move,
              width: 90.w,
              height: 8.h,
              toggleWidth: 15.w,
              toggleMargin: EdgeInsets.all(2.w),
              backgroundColor: Colors.black,
              foregroundChild: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: context.primaryColor,
                ),
                child: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
              ),
              foregroundBuilder: (_, __, child) => child!,
              outerBackgroundBuilder: (context, state, child) {
                return Container(
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      'Add To Cart',
                      style: GoogleFonts.interTight(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  ProductDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductDetailsViewModel();
}
