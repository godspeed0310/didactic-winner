import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.router.dart';
import 'package:echelon/ui/common/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final FirebaseAuthenticationService _authenticationService =
      locator<FirebaseAuthenticationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> loginWithEmail() async {
    String email = emailController.text;
    String password = passwordController.text;
    if (formKey.currentState!.validate()) {
      FirebaseAuthenticationResult result =
          await _authenticationService.loginWithEmail(
        email: email,
        password: password,
      );
      if (result.hasError) {
        _snackbarService.showSnackbar(
          message: result.errorMessage!,
          duration: 2.s,
        );
      } else {
        _snackbarService.showSnackbar(
          message: 'Logged in successfully',
          duration: 2.s,
        );
        _navigationService.replaceWith(Routes.homeView);
      }
    }
  }

  void navigateToRegister() {
    _navigationService.replaceWith(Routes.registerView);
  }
}
