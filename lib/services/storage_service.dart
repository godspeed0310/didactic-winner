import 'dart:io';
import 'dart:typed_data';

import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class StorageService {
  final FirebaseAuthenticationService _auth =
      locator<FirebaseAuthenticationService>();
  final log = getLogger('StorageService');

  final FirebaseStorage _storage = FirebaseStorage.instance;
  Reference get _ref =>
      _storage.ref('users/profile_photos/${_auth.currentUser!.uid}.png');

  Future<String?> uploadProfilePhoto(XFile xfile) async {
    final String path = xfile.path;
    Uint8List file = await File(path).readAsBytes();
    log.i('Uploading profile photo');
    _ref.putData(file);
    return await _ref.getDownloadURL();
  }
}
