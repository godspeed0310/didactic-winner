import 'package:echelon/models/product.dart';
import 'package:echelon/ui/common/app_extensions.dart';
import 'package:echelon/ui/widgets/common/default_system_overlay/default_system_overlay.dart';
import 'package:echelon/ui/widgets/common/product_mini_tile/product_mini_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return DefaultSystemOverlay(
      scaffold: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          titleTextStyle: GoogleFonts.interTight(
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          children: [
            Container(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: context.primaryColor.withOpacity(0.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: context.primaryColor),
                  Gap(5.w),
                  const Expanded(
                    child: Text('Swipe away to remove items from cart'),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: viewModel.cartListenable,
              builder: (_, value, __) {
                final List<Product> products = value.values.toList();

                return ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  itemBuilder: (_, index) {
                    final product = products[index];

                    return Dismissible(
                      onDismissed: (direction) {
                        viewModel.manageCart(product);
                      },
                      key: Key(product.id.toString()),
                      child: ProductMiniTile(product),
                    );
                  },
                  separatorBuilder: (_, __) => Gap(1.h),
                  itemCount: products.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
