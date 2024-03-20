import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/ui/common/app_extensions.dart';
import 'package:echelon/ui/views/product_details/product_details_view.dart';
import 'package:echelon/ui/views/profile/profile_view.dart';
import 'package:echelon/ui/widgets/common/default_system_overlay/default_system_overlay.dart';
import 'package:echelon/ui/widgets/common/product_mini_tile/product_mini_tile.dart';
import 'package:echelon/ui/widgets/common/product_tile/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return DefaultSystemOverlay(
      scaffold: Scaffold(
        appBar: AppBar(
          title: const Text('Echelon'),
          titleTextStyle: GoogleFonts.interTight(
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
          actions: [
            ValueListenableBuilder(
              valueListenable: viewModel.cartListenable,
              builder: (_, value, __) {
                return Badge(
                  alignment: Alignment.topCenter,
                  smallSize: 2.w,
                  isLabelVisible: value.values.toList().isNotEmpty,
                  child: IconButton(
                    onPressed: () => viewModel.openCart(),
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                );
              },
            ),
            Gap(2.w),
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: OpenContainer(
                closedColor: Colors.transparent,
                openColor: context.scaffoldBackground,
                middleColor: Colors.transparent,
                openElevation: 0,
                closedElevation: 0,
                closedBuilder: (_, __) {
                  return CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      viewModel.user.photoURL!,
                    ),
                  );
                },
                openBuilder: (_, __) => const ProfileView(),
              ),
            ),
          ],
        ),
        body: LiquidPullToRefresh(
          onRefresh: () => viewModel.getAPIData(),
          child: Builder(
            builder: (_) {
              if (viewModel.isBusy) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  children: [
                    SizedBox(
                      height: 50.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (_, index) {
                          Product product = viewModel.topProducts[index];

                          return OpenContainer(
                            closedColor: Colors.transparent,
                            openColor: context.scaffoldBackground,
                            middleColor: Colors.transparent,
                            openElevation: 0,
                            closedElevation: 0,
                            closedBuilder: (_, __) => ProductTile(product),
                            openBuilder: (_, __) => ProductDetailsView(product),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return Gap(5.w);
                        },
                        itemCount: viewModel.topProducts.length,
                      ),
                    ),
                    Gap(3.h),
                    Text(
                      'Recommended',
                      style: GoogleFonts.interTight(
                        fontWeight: FontWeight.bold,
                        color: context.onSurface,
                        fontSize: 15.sp,
                      ),
                    ),
                    ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        Product product = viewModel.recommendedProducts[index];

                        return OpenContainer(
                          closedColor: Colors.transparent,
                          openColor: context.scaffoldBackground,
                          middleColor: Colors.transparent,
                          openElevation: 0,
                          closedElevation: 0,
                          closedBuilder: (_, __) => ProductMiniTile(product),
                          openBuilder: (_, __) => ProductDetailsView(product),
                        );
                      },
                      separatorBuilder: (_, __) {
                        return Gap(2.h);
                      },
                      itemCount: viewModel.recommendedProducts.length,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(
    HomeViewModel viewModel,
  ) {
    viewModel.initializeViewModel();
  }
}
