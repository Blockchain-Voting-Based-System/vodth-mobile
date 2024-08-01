import 'package:firebase_auth/firebase_auth.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';

class AccountViewModel extends BaseViewModel {
  String? get userEmail => FirebaseAuth.instance.currentUser?.email;
}
