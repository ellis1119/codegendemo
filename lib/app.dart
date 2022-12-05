import 'package:codegensystem/pages/loginPage.dart';
import 'package:codegensystem/pages/mainBar.dart';
import 'package:codegensystem/pages/registerPage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return (
        //  create: (context) => Favorites(),
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'codeGenTest',
          initialRoute: '/login',
          routes: {
            '/login': (context) => const MainBar(),
            '/home': (context) => const MainBar(),
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),

          },
        )
    );
  }
}
