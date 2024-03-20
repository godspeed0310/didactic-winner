import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:echelon/models/app_user.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/firestore_service.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class ProfileViewModel extends BaseViewModel {
  final HiveService _hiveService = locator<HiveService>();
  final FirebaseAuthenticationService _auth =
      locator<FirebaseAuthenticationService>();
  AppUser get user => _hiveService.loggedInUser;
  DateTime get _dateJoinedRaw => _auth.currentUser!.metadata.creationTime!;
  String get dateJoined => DateFormat('dd MMMM yyyy').format(_dateJoinedRaw);
  List<Product> get favourites =>
      _hiveService.favouriteListenable.value.values.toList();
  final TextEditingController nameController = TextEditingController();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final log = getLogger('ProfileViewModel');

  bool isEditing = false;

  void updateProfile() {}

  void toggleEditing() {
    if (isEditing) {
      isEditing = false;
      AppUser user = _hiveService.loggedInUser;
      if (nameController.text.isNotEmpty && nameController.text != user.name) {
        user = user.copyWith(name: nameController.text);
        _firestoreService.updateProfile(user);
        log.i('Updated user profile: $user');
      }
      log.i('No changes made, cancelling editing');
    } else {
      isEditing = true;
    }
    notifyListeners();
  }
}
