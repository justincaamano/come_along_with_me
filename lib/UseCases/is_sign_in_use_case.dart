



import 'package:come_along_with_me/Repository/firebase_Reposity.dart';

class IsSignInUseCase {

  final FirebaseReposity reposity;

  IsSignInUseCase({required this.reposity});

  Future<bool> call() {
    return reposity.isSignIn();
  }
}