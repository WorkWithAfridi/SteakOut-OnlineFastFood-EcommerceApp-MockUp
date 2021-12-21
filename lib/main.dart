import 'package:flutter/material.dart';
import 'package:meat_one/model/product/data_model_for_promotions.dart';
import 'package:meat_one/view/home_page/home_page.dart';
import 'package:meat_one/view/home_page/home_tab/product_page.dart';
import 'package:meat_one/view/landing_page/landing_page.dart';
import 'package:meat_one/view/signin_page/login_with_phone_number.dart';
import 'package:meat_one/view/signin_page/signin_page.dart';
import 'package:meat_one/view/signup_page/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //test
    return MaterialApp(
      title: 'StakeOut',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xffEC1A25),
          secondary: Color(0xff212121),
          background: Color(0xffFFFFFF),
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: LandingPage.routeName,
      routes: {
        LandingPage.routeName: (context) => LandingPage(),
        SignInPage.routeName: (context) => SignInPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        SigninWithPhoneNumber.routeName: (context) => SigninWithPhoneNumber(),
        HomePage.routeName: (context) => HomePage(),
        ProductPage.routeName:(context)=>ProductPage(),
      },
    );
  }
}
