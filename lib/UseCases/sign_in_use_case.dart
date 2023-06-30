



import 'package:come_along_with_me/Repository/firebase_Reposity.dart';

import '../Entities/user_entitiy.dart';

class SignInCase{

  final FirebaseReposity reposity;

  SignInCase({required this.reposity});

  Future<void> call(UserEntity user) {
    return reposity.signIn(user);
  }
}