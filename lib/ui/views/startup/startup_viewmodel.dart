import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:echelon/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final FirebaseAuthenticationService _authenticationService =
      locator<FirebaseAuthenticationService>();
  final log = getLogger('StartupViewModel');

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    log.i('App Started');
    final bool isAuthenticated = _authenticationService.hasUser;
    if (isAuthenticated) {
      log.i('User is authenticated, navigating to home view');
      _navigationService.replaceWith(Routes.homeView);
    } else {
      log.i('User is not authenticated, navigating to login view');
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
