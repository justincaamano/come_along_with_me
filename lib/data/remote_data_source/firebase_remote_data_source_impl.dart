import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:come_along_with_me/Entities/user_entitiy.dart';
import 'package:come_along_with_me/data/remote_data_source/firebase_remote_data.dart';
import 'package:come_along_with_me/data/remote_data_source/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FirebaseRemoteDataSourceImpl({required this.firestore, required this.auth});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = firestore.collection('users');

    final uid = await getCurrentUserId();

    if (uid != null) {
      final newUser = UserModel(
        name: user.name,
        email: user.email,
        password: user.password,
        phone: user.phone,
        profileUrl: user.profileUrl,
        status: user.status,
        uid: uid,
      ).toDocument();

      final userDoc = await userCollection.doc(uid).get();

      if (!userDoc.exists) {
        await userCollection.doc(uid).set(newUser);
      }
    }
  }

  @override
  Future<String> getCurrentUserId() async => auth.currentUser!.uid;

  @override
  Future<void> getUpdateUser(UserEntity user) {
    // TODO: implement getUpdateUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser != null;

  @override
  Future<void> signIn(UserEntity user) async {
    final email = user.email;
    final password = user.password;

    if (email != null && password != null) {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
  }

  @override
  Future<void> signOut() async => await auth.signOut();

  @override
  Future<void> signUp(UserEntity user) async {
    final email = user.email;
    final password = user.password;

    if (email != null && password != null) {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
  }
}