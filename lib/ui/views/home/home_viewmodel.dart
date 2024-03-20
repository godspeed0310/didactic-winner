import 'package:chopper/chopper.dart';
import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:echelon/models/app_user.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:echelon/services/store_service.dart';
import 'package:echelon/ui/views/cart/cart_view.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final StoreService _storeService = locator<StoreService>();
  final log = getLogger('HomeViewModel');
  final List<Product> topProducts = <Product>[];
  final List<Product> recommendedProducts = <Product>[];
  final HiveService _hiveService = locator<HiveService>();
  AppUser get user => _hiveService.loggedInUser;
  final NavigationService _navigationService = locator<NavigationService>();

  ValueListenable get cartListenable => _hiveService.cartListenable;

  void initializeViewModel() async {
    await getAPIData();
  }

  void openCart() {
    _navigationService.navigateWithTransition(
      const CartView(),
      transitionStyle: Transition.rightToLeft,
    );
  }

  Future<void> getAPIData() async {
    topProducts.clear();
    recommendedProducts.clear();
    Response<List<Product>> result = await runBusyFuture(
      _storeService.getProducts(limit: 10),
    );
    topProducts.addAll(result.body!.sublist(0, 5));
    recommendedProducts.addAll(result.body!.sublist(5));
    notifyListeners();
  }
}
