import 'package:cached_network_image/cached_network_image.dart';
import 'package:echelon/models/app_user.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/ui/common/app_extensions.dart';
import 'package:echelon/ui/widgets/common/default_system_overlay/default_system_overlay.dart';
import 'package:echelon/ui/widgets/common/product_mini_tile/product_mini_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  final AppUser user;

  const ProfileView(this.user, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return DefaultSystemOverlay(
      scaffold: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          titleTextStyle: GoogleFonts.interTight(
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
          actions: [
            IconButton(
              onPressed: () => viewModel.toggleEditing(),
              icon: AnimatedCrossFade(
                duration: 300.ms,
                crossFadeState: viewModel.isEditing
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: const Icon(Icons.done),
                secondChild: const Icon(Icons.edit_outlined),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Badge(
                  isLabelVisible: viewModel.isEditing,
                  alignment: Alignment.bottomRight,
                  label: Icon(Icons.edit_outlined, size: 4.w),
                  largeSize: 6.w,
                  backgroundColor: context.primaryColor,
                  child: CircleAvatar(
                    radius: 13.w,
                    backgroundImage: CachedNetworkImageProvider(
                      viewModel.user.photoURL!,
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedCrossFade(
                        firstChild: Text(
                          viewModel.user.name ?? 'Echelon User',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                        secondChild: TextField(
                          controller: viewModel.nameController,
                          autofocus: true,
                          autofillHints: const [AutofillHints.name],
                          textCapitalization: TextCapitalization.words,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Enter your name',
                          ),
                        ),
                        crossFadeState: viewModel.isEditing
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: 300.ms,
                      ),
                      Text(user.email),
                      Text('Member since: ${viewModel.dateJoined}'),
                    ],
                  ),
                ),
              ],
            ),
            Gap(5.h),
            Text(
              'Favourites',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
            Gap(2.h),
            ListView.separated(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                Product product = viewModel.favourites[index];

                return ProductMiniTile(product);
              },
              separatorBuilder: (_, __) => Gap(1.h),
              itemCount: viewModel.favourites.length,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
