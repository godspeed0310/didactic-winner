import 'package:echelon/app/app.locator.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class ProductTileModel extends BaseViewModel {
  final HiveService _hiveService = locator<HiveService>();

  ValueListenable get favouriteListenable => _hiveService.favouriteListenable;

  void manageFavourite(Product product) {
    _hiveService.manageFavourites(product);
  }
}
