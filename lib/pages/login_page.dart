

import 'package:come_along_with_me/Entities/user_entitiy.dart';
import 'package:come_along_with_me/widgets/Labels.dart';
import 'package:come_along_with_me/widgets/Logo.dart';
import 'package:come_along_with_me/widgets/btn_login.dart';
import 'package:come_along_with_me/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth/cubit/auth_cubit.dart';
import '../cubit/credential/cubit/credential_cubit.dart';
import 'Dashboard.dart';

class LoginPage extends StatelessWidget {
 final String uid;

  const LoginPage({super.key, required this.uid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView ( 
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
          child:  Column(
            children:  <Widget>[
              Logo(),
              _Form(),
              Labels(ruta: 'register',
              titulo: 'No tienes cuenta?',
              subtitulo: 'Crea una ahora!',),
        ],
       )
       )
      )
    )
    );
  }
}


class _Form extends StatefulWidget {
  
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

final emailCtrl = TextEditingController();
final passCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, CredentialState) {
          if (CredentialState is CredentialSucess){
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
    
          if (CredentialState is CredentialFailure){
            print("Invalid credentials");
          }
        },
        builder: (context, CredentialState) {
    
          if (CredentialState is CredentialLoading){
            return CircularProgressIndicator();
          }
    
          if (CredentialState is CredentialSucess){
            return BlocBuilder<AuthCubit,AuthState>(builder: (context, authState ) {
              if(authState is AuthenticatedState){
                return DashboardPage(uid: authState.uid,);
              }else{ return _bodyWidget();}
            }
            
            );
          }
          return _bodyWidget();
        },
      ),
    );
    
  }
  
  _bodyWidget() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children:  <Widget>[
          
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
            
          ),

            CustomInput(
            icon: Icons.lock_outlined,
            placeholder: 'Password',
            textController: passCtrl,
            isPassword: true,
          ),
          
           buttonLogin(text: "Ingresar", onPressed: () {
              _submitSignIn();
           })
       
        ]  
      ),
               
    );
  }

  void _submitSignIn(){

    if(emailCtrl.text.isEmpty){
      return;
    }
    if(passCtrl.text.isEmpty){
      return;
    }


    BlocProvider.of<CredentialCubit>(context).submitSignIn(user: UserEntity(
      email: emailCtrl.text,
      password: passCtrl.text,
      uid: "",
    ));
  }


}


