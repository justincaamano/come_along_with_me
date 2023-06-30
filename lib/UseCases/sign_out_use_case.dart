




import 'package:come_along_with_me/Repository/firebase_Reposity.dart';

class SignOutUseCase {
  final FirebaseReposity reposity;

  SignOutUseCase({required this.reposity});

  Future<void> call() {
    return reposity.signOut();
  }
}