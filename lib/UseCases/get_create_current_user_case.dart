



import 'package:come_along_with_me/Repository/firebase_Reposity.dart';

import '../Entities/user_entitiy.dart';

class CreateCurrentUserCase{

  final FirebaseReposity reposity;

  CreateCurrentUserCase({required this.reposity});

  Future<void> call(UserEntity user) {
    return reposity.getCreateCurrentUser(user);
  }
}