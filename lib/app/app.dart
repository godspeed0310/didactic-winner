import 'package:echelon/services/store_service.dart';
import 'package:echelon/ui/views/home/home_view.dart';
import 'package:echelon/ui/views/login/login_view.dart';
import 'package:echelon/ui/views/register/register_view.dart';
import 'package:echelon/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:echelon/ui/views/product_details/product_details_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ProductDetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: StoreService, resolveUsing: StoreService.create),
    // @stacked-service
  ],
  logger: StackedLogger(),
)
class App {}
