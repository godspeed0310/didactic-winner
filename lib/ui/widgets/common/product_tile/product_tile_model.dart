import 'package:echelon/app/app.locator.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class ProductTileModel extends BaseViewModel {
  final HiveService _hiveService = locator<HiveService>();

  ValueListenable get favouriteListenable => _hiveService.favouriteListenable;
  ValueListenable get cartListenable => _hiveService.cartListenable;

  void manageFavourite(Product product) {
    _hiveService.manageFavourites(product);
  }

  void manageCart(Product product) async {
    await _hiveService.manageCart(product);
  }
}
