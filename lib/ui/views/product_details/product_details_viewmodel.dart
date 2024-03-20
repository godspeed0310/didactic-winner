import 'package:echelon/app/app.locator.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsViewModel extends BaseViewModel {
  final HiveService _hiveService = locator<HiveService>();

  ValueListenable get cartListenable => _hiveService.cartListenable;
  ValueListenable get favouriteListenable => _hiveService.favouriteListenable;

  void manageCart(Product product) {
    _hiveService.manageCart(product);
  }

  void manageFavourite(Product product) {
    _hiveService.manageFavourites(product);
  }
}
