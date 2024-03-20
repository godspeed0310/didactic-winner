import 'package:echelon/app/app.locator.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsViewModel extends BaseViewModel {
  final HiveService _hiveService = locator<HiveService>();

  ValueListenable get cartListenable => _hiveService.cartListenable;

  void manageCart(Product product) {
    _hiveService.manageCart(product);
  }
}
