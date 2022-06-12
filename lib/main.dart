// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:gafashop/common/Widgets/bottom_bar.dart';
import 'package:gafashop/constants/global_variables.dart';
import 'package:gafashop/features/auth/screens/auth_screen.dart';
import 'package:gafashop/features/auth/services/auth_service.dart';
import 'package:gafashop/features/home/screens/home_screen.dart';
import 'package:gafashop/providers/user_provider.dart';
import 'package:gafashop/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gafa Shop',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        //whenever an new route is created we pass in the settings
        onGenerateRoute: (settings) => generateRoute(settings),
        home: true ? const BottomBar() : const AuthScreen());
  }
}
