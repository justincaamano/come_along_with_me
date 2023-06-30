



import 'package:come_along_with_me/Entities/user_entitiy.dart';
import 'package:come_along_with_me/Repository/firebase_Reposity.dart';
import 'package:come_along_with_me/data/remote_data_source/firebase_remote_data.dart';

class FirebaseReposityImpl implements FirebaseReposity{


  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseReposityImpl({required this.remoteDataSource});



 @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    remoteDataSource.getCreateCurrentUser(user);
  }

  @override
  Future<String> getCurrentUserId() => remoteDataSource.getCurrentUserId();

  @override
  Future<void> getUpdateUser(UserEntity user) async {
    remoteDataSource.getUpdateUser(user);
  }

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user)async {
    remoteDataSource.signIn(user);
  }

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async{
    remoteDataSource.signUp(user);
  }
}