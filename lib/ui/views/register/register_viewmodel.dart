import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:echelon/app/app.router.dart';
import 'package:echelon/services/firestore_service.dart';
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
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final log = getLogger('RegisterViewModel');

  Future<void> registerWithEmail() async {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (formKey.currentState!.validate()) {
      if (password == confirmPassword) {
        await _authenticationService.createAccountWithEmail(
          email: email,
          password: password,
        );
        await _firestoreService.createUser().catchError(
          (e, s) {
            log.e('Error creating account', e, s);
            _snackbarService.showSnackbar(
              message: 'Error creating account',
              duration: 2.s,
            );
          },
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
