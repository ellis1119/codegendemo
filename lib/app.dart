import 'package:flutter/material.dart';
import './pages/mainBar.dart';

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
          initialRoute: '/',
          routes: {
            '/': (context) => const MainBar(),
            '/home': (context) => const MainBar(),
            '/chatPage': (context) => const MainBar(),
            '/login': (context) => const MainBar(),
            '/register': (context) => const MainBar(),
            '/sendMoments': (context) => const MainBar(),
            '/infoPage': (context) => const MainBar(),
            '/friendDetPage': (context) => const MainBar(),

          },
        )
    );
  }
}
