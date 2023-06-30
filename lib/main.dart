import 'package:come_along_with_me/cubit/auth/cubit/auth_cubit.dart';
import 'package:come_along_with_me/cubit/credential/cubit/credential_cubit.dart';
import 'package:come_along_with_me/pages/Dashboard.dart';
import 'package:come_along_with_me/pages/login_page.dart';
import 'package:come_along_with_me/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import "injection_container.dart" as di;
void main() async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
await di.init();



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<CredentialCubit>(create: (_) => di.sl<CredentialCubit>())
      ],
      child: MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Cawm',
  initialRoute: 'login',
  routes: appRoutes,
  home: BlocBuilder<AuthCubit, AuthState>(
    builder: (context, authState) {
      if (authState is AuthenticatedState) {
        return DashboardPage(uid: authState.uid);
      } else {
        return LoginPage(uid: '',);
      }
    },
  ),
),
    );
  }
}