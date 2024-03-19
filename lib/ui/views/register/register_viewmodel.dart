import 'package:echelon/app/app.router.dart';
import 'package:echelon/ui/common/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final NavigationService _navigationService = NavigationService();
  final SnackbarService _snackbarService = SnackbarService();
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();

  Future<void> registerWithEmail() async {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (formKey.currentState!.validate()) {
      if (password == confirmPassword) {
        _authenticationService.createAccountWithEmail(
          email: email,
          password: password,
        );
        _snackbarService.showSnackbar(
          message: 'Account created successfully',
          duration: 2.s,
        );
        _navigationService.replaceWith(Routes.homeView);
      } else {
        _snackbarService.showSnackbar(
          message: 'Passwords do not match',
          duration: 2.s,
        );
      }
    }
  }

  void navigateToLogin() {
    _navigationService.replaceWith(Routes.loginView);
  }
}
