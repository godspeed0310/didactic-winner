import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:echelon/ui/common/app_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductTileModel extends BaseViewModel {
  final HiveService _hiveService = locator<HiveService>();

  ValueListenable get favouriteListenable => _hiveService.favouriteListenable;
  ValueListenable get cartListenable => _hiveService.cartListenable;
  final log = getLogger('ProductTileModel');
  final SnackbarService _snackbarService = locator<SnackbarService>();

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

  void manageCart(Product product) async {
    await _hiveService.manageCart(product).catchError(
      (e, s) {
        log.e('Error managing cart', e, s);
        _snackbarService.showSnackbar(
          message: 'Error managing cart: $e',
          duration: 2.s,
        );
      },
    );
  }
}
