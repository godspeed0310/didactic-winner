import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:echelon/ui/common/app_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailsViewModel extends BaseViewModel {
  final HiveService _hiveService = locator<HiveService>();

  ValueListenable get cartListenable => _hiveService.cartListenable;
  ValueListenable get favouriteListenable => _hiveService.favouriteListenable;
  final log = getLogger('ProductDetailsViewModel');
  final SnackbarService _snackbarService = locator<SnackbarService>();

  void manageCart(Product product) {
    _hiveService.manageCart(product).catchError((e, s) {
      log.e('Error managing cart', e, s);
      _snackbarService.showSnackbar(
        message: 'Error managing cart: $e',
        duration: 2.s,
      );
    });
  }

  void manageFavourite(Product product) {
    _hiveService.manageFavourites(product).catchError(
      (e, s) {
        log.e('Error managing favourites', e, s);
        _snackbarService.showSnackbar(
          message: 'Error managing favourites: $e',
          duration: 2.s,
        );
      },
    );
  }
}
