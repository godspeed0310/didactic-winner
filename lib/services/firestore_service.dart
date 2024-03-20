import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echelon/app/app.locator.dart';
import 'package:echelon/app/app.logger.dart';
import 'package:echelon/models/app_user.dart';
import 'package:echelon/services/hive_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuthenticationService _authenticationService =
      locator<FirebaseAuthenticationService>();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  final log = getLogger('FirestoreService');
  final HiveService _hiveService = locator<HiveService>();

  Future<void> syncUser() async {
    final String uid = _authenticationService.currentUser!.uid;
    try {
      if (await userExists(uid)) {
        log.i('User exists, syncing user data');
        final AppUser user = await getUser();
        await _hiveService.setLoggedInUser(user);
      } else {
        log.i('User does not exist, creating user');
        await createUser();
      }
    } on Exception catch (e) {
      log.e('Error syncing user: $e');
      rethrow;
    }
  }

  Future<bool> userExists(String uid) {
    return _users.doc(uid).get().then((doc) => doc.exists);
  }

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

  Future<AppUser> getUser() async {
    final String uid = _authenticationService.currentUser!.uid;
    try {
      final DocumentSnapshot userDoc = await _users.doc(uid).get();
      return AppUser.fromJson(userDoc.data() as Map<String, dynamic>);
    } on Exception catch (e) {
      log.e('Error getting user: $e');
      rethrow;
    }
  }
}
