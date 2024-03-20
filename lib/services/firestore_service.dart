import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:echelon/models/app_user.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuthenticationService _authenticationService =
      locator<FirebaseAuthenticationService>();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  final log = getLogger('FirestoreService');

  Future<void> createUser() async {
    final String uid = _authenticationService.currentUser!.uid;

    AppUser user = AppUser(
      id: uid,
      email: _authenticationService.currentUser!.email!,
      photoURL: 'https://robohash.org/$uid.png',
    );
    try {
      await _users.doc(user.id).set(user.toJson());
    } on Exception catch (e) {
      log.e('Error creating user: $e');
      rethrow;
    }
  }
}
