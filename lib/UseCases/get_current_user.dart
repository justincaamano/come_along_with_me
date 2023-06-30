




import '../Repository/firebase_Reposity.dart';

class GetCurrentUserIdCase{

  final FirebaseReposity reposity;

  GetCurrentUserIdCase({required this.reposity});

  Future<String> call() {
    return reposity.getCurrentUserId();
  }
}