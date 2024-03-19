import 'package:echelon/ui/common/app_extensions.dart';
import 'package:echelon/ui/widgets/common/default_system_overlay/default_system_overlay.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return DefaultSystemOverlay(
      scaffold: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          children: [
            Text(
              'Echelon',
              style: GoogleFonts.interTight(
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
              ),
            ),
            Text(
              'Create an account to continue',
              style: GoogleFonts.interTight(
                fontSize: 15.sp,
              ),
            ),
            Gap(5.h),
            Form(
              key: viewModel.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.interTight(),
                  ),
                  Gap(1.h),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      return null;
                    },
                    controller: viewModel.emailController,
                    autocorrect: false,
                    style: GoogleFonts.interTight(),
                    autofillHints: const [AutofillHints.email],
                    decoration: InputDecoration(
                      hintText: 'e.g johndoe@gmail.com',
                      hintStyle: GoogleFonts.interTight(),
                      labelStyle: GoogleFonts.interTight(),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  Gap(2.h),
                  Text(
                    'Password',
                    style: GoogleFonts.interTight(),
                  ),
                  Gap(1.h),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: viewModel.passwordController,
                    autocorrect: false,
                    style: GoogleFonts.interTight(),
                    autofillHints: const [AutofillHints.password],
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: GoogleFonts.interTight(),
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.interTight(),
                    ),
                  ),
                  Gap(2.h),
                  Text(
                    'Confirm Password',
                    style: GoogleFonts.interTight(),
                  ),
                  Gap(1.h),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm Password cannot be empty';
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: viewModel.confirmPasswordController,
                    autocorrect: false,
                    style: GoogleFonts.interTight(),
                    autofillHints: const [AutofillHints.password],
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: GoogleFonts.interTight(),
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.interTight(),
                    ),
                  ),
                ],
              ),
            ),
            Gap(3.h),
            ElevatedButton(
              onPressed: () => viewModel.registerWithEmail(),
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.w),
                  ),
                ),
                fixedSize: MaterialStatePropertyAll(
                  Size.fromHeight(
                    6.h,
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(context.primaryColor),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.interTight(
                  fontSize: 12.sp,
                  color: context.onSurface,
                ),
              ),
            ),
            Gap(2.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have an account? ',
                style: GoogleFonts.interTight(),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = viewModel.navigateToLogin,
                    text: 'Sign in',
                    style: GoogleFonts.interTight(
                      color: context.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
