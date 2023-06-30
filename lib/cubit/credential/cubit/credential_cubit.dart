import 'dart:io';

import 'package:come_along_with_me/Entities/user_entitiy.dart';
import 'package:come_along_with_me/UseCases/get_create_current_user_case.dart';
import 'package:come_along_with_me/UseCases/sign_in_use_case.dart';
import 'package:come_along_with_me/UseCases/sing_up_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInCase signInUseCase;
  final SignUpCase signUpUseCase;
  final CreateCurrentUserCase createCurrentUserCase;
  
  CredentialCubit({
    required this.signInUseCase, 
  required this.signUpUseCase, 
  required this.createCurrentUserCase}
  ) : super(CredentialInitial());


  Future<void> submitSignIn({required UserEntity user}) async {
    emit(CredentialLoading());
    try{
       signInUseCase.call(user);
        emit(CredentialSucess());
    }on SocketException catch(_){
        emit(CredentialFailure());
    }catch(_){
      emit(CredentialFailure());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
        emit(CredentialLoading());

    try{
      await signUpUseCase.call(user);
      await createCurrentUserCase.call(user);
      emit(CredentialSucess());
    }on SocketException catch(_){
        emit(CredentialFailure());
    }catch(_){
      emit(CredentialFailure());
    }
  }
}

