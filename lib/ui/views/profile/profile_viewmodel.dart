import 'package:echelon/app/app.locator.dart';
import 'package:echelon/models/app_user.dart';
import 'package:echelon/models/product.dart';
import 'package:echelon/services/hive_service.dart';
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
}
