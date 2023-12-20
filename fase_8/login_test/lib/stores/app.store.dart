import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'app.store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @action
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
