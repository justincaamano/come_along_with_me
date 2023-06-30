




import 'package:come_along_with_me/Entities/user_entitiy.dart';
import 'package:come_along_with_me/Repository/firebase_Reposity.dart';

class GetUpdateUserCase {
  final FirebaseReposity repository;

  GetUpdateUserCase({required this.repository});

  Future<void> getUpdateUser(UserEntity User) {
    return repository.getUpdateUser(User);
  }
}