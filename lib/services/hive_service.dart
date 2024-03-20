import 'dart:async';

import 'package:echelon/app/app.logger.dart';
import 'package:echelon/models/app_user.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/models/product_rating.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  late final Box<Product> favouriteBox;
  late final Box<Product> cartBox;
  late final Box<AppUser> loggedInUserBox;
  final log = getLogger('HiveService');

  Future<void> initializeHive() async {
    try {
      log.i('Initializing Hive');
      await Hive.initFlutter();
      log.i('Registering adapters');
      Hive.registerAdapter(ProductAdapter());
      Hive.registerAdapter(ProductRatingAdapter());
      Hive.registerAdapter(AppUserAdapter());
      log.i('Opening favourite and cart boxes');
      favouriteBox = await Hive.openBox<Product>('favourites');
      cartBox = await Hive.openBox<Product>('cart');
      log.i('Opening loggedInUser box');
      loggedInUserBox = await Hive.openBox<AppUser>('loggedInUser');
    } on Exception catch (e) {
      log.e('Error initializing Hive: $e');
      rethrow;
    }
  }

  Future<void> setLoggedInUser(AppUser user) async {
    try {
      log.i('Setting logged in user');
      await loggedInUserBox.put(user.id, user);
    } on Exception catch (e) {
      log.e('Error setting logged in user: $e');
      rethrow;
    }
  }

  AppUser get loggedInUser => loggedInUserListenable.value.values.first;

  ValueListenable get loggedInUserListenable => loggedInUserBox.listenable();
  ValueListenable get favouriteListenable => favouriteBox.listenable();
  ValueListenable get cartListenable => cartBox.listenable();

  Future<void> manageCart(Product product) async {
    try {
      if (cartBox.containsKey(product.id)) {
        log.i('Removing product from cart');
        await cartBox.delete(product.id);
      } else {
        log.i('Adding product to cart');
        await cartBox.put(product.id, product);
      }
    } on Exception catch (e) {
      log.e('Error managing cart: $e');
      rethrow;
    }
  }

  Future<void> manageFavourites(Product product) async {
    try {
      if (favouriteBox.containsKey(product.id)) {
        log.i('Removing product from favourites');
        await favouriteBox.delete(product.id);
      } else {
        log.i('Adding product to favourites');
        await favouriteBox.put(product.id, product);
      }
    } on Exception catch (e) {
      log.e('Error managing favourites: $e');
      rethrow;
    }
  }
}
