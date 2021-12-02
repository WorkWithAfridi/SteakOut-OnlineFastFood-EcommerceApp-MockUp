import 'package:flutter/material.dart';
import 'package:meat_one/view/landing_page/landing_page.dart';
import 'package:meat_one/view/signin_page/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xffEC1A25),
          secondary: Color(0xff212121),
            background: Color(0xffFFFFFF)
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: LandingPage.routeName,
      routes: {
        LandingPage.routeName:(context)=>LandingPage(),
        SignInPage.routeName:(context)=>SignInPage(),
      },
    );
  }
}