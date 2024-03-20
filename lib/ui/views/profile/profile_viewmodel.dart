import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:echelon/models/app_user.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/firestore_service.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:echelon/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

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
  final ImagePicker _imagePicker = ImagePicker();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final StorageService _storageService = locator<StorageService>();
  XFile? _pickedImage;

  bool isEditing = false;

  void updateProfilePhoto() async {
    if (isEditing) {
      HapticFeedback.mediumImpact();
      _pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (_pickedImage == null) {
        _snackbarService.showSnackbar(message: 'No image selected');
      } else {
        updateProfile();
      }
    }
  }

  Future<void> updateProfile() async {
    AppUser user = _hiveService.loggedInUser;
    if ((nameController.text.isNotEmpty && nameController.text != user.name) ||
        _pickedImage != null) {
      if (nameController.text.isNotEmpty && nameController.text != user.name) {
        log.i('Updating name to: ${nameController.text}');
        user = user.copyWith(name: nameController.text);
      }
      if (_pickedImage != null) {
        String url = await _storageService.uploadProfilePhoto(_pickedImage!);
        log.i('Uploaded profile photo: $url');
        user = user.copyWith(photoURL: url);
      }
      await _firestoreService.updateProfile(user);
      log.i('Updated user profile: $user');
      isEditing = false;
    } else {
      log.i('No changes made, cancelling editing');
    }
    notifyListeners();
  }

  void toggleEditing() async {
    if (isEditing) {
      await updateProfile();
      isEditing = false;
    } else {
      isEditing = true;
    }
    notifyListeners();
  }
}
