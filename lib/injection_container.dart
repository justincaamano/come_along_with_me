

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:come_along_with_me/Repository/firebase_Reposity.dart';
import 'package:come_along_with_me/UseCases/get_current_user.dart';
import 'package:come_along_with_me/UseCases/is_sign_in_use_case.dart';
import 'package:come_along_with_me/UseCases/sign_out_use_case.dart';
import 'package:come_along_with_me/cubit/auth/cubit/auth_cubit.dart';
import 'package:come_along_with_me/cubit/credential/cubit/credential_cubit.dart';
import 'package:come_along_with_me/data/remote_data_source/firebase_remote_data.dart';
import 'package:come_along_with_me/data/remote_data_source/firebase_remote_data_source_impl.dart';
import 'package:come_along_with_me/data/remote_data_source/firebase_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'UseCases/get_create_current_user_case.dart';
import 'UseCases/sign_in_use_case.dart';
import 'UseCases/sing_up_use_case.dart';

final sl = GetIt.instance;


Future<void> init() async{


  //bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
    isSignInUseCase: sl.call(), 
    getCurrentUserIdCase: sl.call(), 
    signOutUseCase: sl.call()));

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
    signInUseCase: sl.call(), 
    signUpUseCase: sl.call(), 
    createCurrentUserCase: sl.call()));



  //use cases
  //auth cases
  sl.registerLazySingleton<GetCurrentUserIdCase>(() => GetCurrentUserIdCase(reposity: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(() => IsSignInUseCase(reposity: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(reposity: sl.call()));

  //credential cases
  sl.registerLazySingleton<SignInCase>(() => SignInCase(reposity: sl.call()));
  sl.registerLazySingleton<SignUpCase>(() => SignUpCase(reposity: sl.call()));
  sl.registerLazySingleton<CreateCurrentUserCase>(() => CreateCurrentUserCase(reposity: sl.call()));





  //repository
sl.registerLazySingleton<FirebaseReposity>(() => FirebaseReposityImpl(remoteDataSource: sl.call() ));


  //Remote Data Source

sl.registerLazySingleton<FirebaseRemoteDataSource>(() => FirebaseRemoteDataSourceImpl(firestore: sl.call(), auth: sl.call()));

  //External
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => firestore);
}