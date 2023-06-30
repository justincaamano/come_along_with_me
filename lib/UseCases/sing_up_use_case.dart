


import 'package:come_along_with_me/Entities/user_entitiy.dart';
import 'package:come_along_with_me/Repository/firebase_Reposity.dart';

class SignUpCase {

  final FirebaseReposity reposity;

  SignUpCase({required this.reposity});

  Future<void> call(UserEntity user) {
    return reposity.signUp(user);
  }
}