import 'package:come_along_with_me/Entities/user_entitiy.dart';
import 'package:come_along_with_me/cubit/auth/cubit/auth_cubit.dart';
import 'package:come_along_with_me/cubit/credential/cubit/credential_cubit.dart';
//import 'package:come_along_with_me/pages/Dashboard.dart';
import 'package:come_along_with_me/widgets/Labels.dart';
import 'package:come_along_with_me/widgets/Logo.dart';
import 'package:come_along_with_me/widgets/btn_login.dart';
import 'package:come_along_with_me/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_page.dart';

class registerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(
                      children: <Widget>[
                        Logo(),
                        _Form(),
                        Labels(
                          ruta: 'login',
                          titulo: 'Ya tienes cuenta?',
                          subtitulo: 'Ingresa ahora!',
                        ),
                      ],
                    )))));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, CredentialState) {
          if (CredentialState is CredentialSucess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }

          if (CredentialState is CredentialFailure) {
            print("Invalid credentials");
          }
        },
        builder: (context, CredentialState) {
          if (CredentialState is CredentialLoading) {
            return CircularProgressIndicator();
          }

          if (CredentialState is CredentialSucess) {
            return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
              if (authState is AuthenticatedState) {
                return LoginPage(
                  uid: authState.uid,
                );
              } else {
                return _bodyWidget();
              }
            });
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
      child: Column(children: <Widget>[
        CustomInput(
          icon: Icons.perm_identity,
          placeholder: 'Nombre',
          keyboardType: TextInputType.text,
          textController: nameCtrl,
        ),
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
        buttonLogin(
            text: "Registrarse",
            onPressed: () {
              _submitSignUp();
            })
      ]),
    );
  }

  void _submitSignUp() {
    if (nameCtrl.text.isEmpty) {
      return;
    }
    if (emailCtrl.text.isEmpty) {
      return;
    }
    if (passCtrl.text.isEmpty) {
      return;
    }
    BlocProvider.of<CredentialCubit>(context).submitSignUp(
        user: UserEntity(
            name: nameCtrl.text,
            email: emailCtrl.text,
            password: passCtrl.text,
            isOnline: false,
            status: "",
            profileUrl: "",
            phone: "",
            uid: ""));
  }
}
