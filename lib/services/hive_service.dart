import 'package:echelon/app/app.logger.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/models/product_rating.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  late final Box<Product> favouriteBox;
  late final Box<Product> cartBox;
  final log = getLogger('HiveService');

  Future<void> initializeHive() async {
    log.i('Initializing Hive');
    await Hive.initFlutter();
    log.i('Registering adapters');
    Hive.registerAdapter(ProductAdapter());
    Hive.registerAdapter(ProductRatingAdapter());
    log.i('Opening favourite and cart boxes');
    favouriteBox = await Hive.openBox<Product>('favourites');
    cartBox = await Hive.openBox<Product>('cart');
  }

  ValueListenable get favouriteListenable => favouriteBox.listenable();
  ValueListenable get cartListenable => cartBox.listenable();

  void manageFavourites(Product product) {
    if (favouriteBox.containsKey(product.id)) {
      log.i('Removing product from favourites');
      favouriteBox.delete(product.id);
    } else {
      log.i('Adding product to favourites');
      favouriteBox.put(product.id, product);
    }
  }
}
