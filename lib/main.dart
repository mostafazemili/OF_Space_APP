import 'package:flutter/material.dart';
import 'package:qatar_ui_app/onboarding_screen/onboarding_screen.dart';
import 'package:qatar_ui_app/screen/app/bottom_navigation/bottom_navigation_screen.dart';
import 'package:qatar_ui_app/screen/app/chat_screen.dart';
import 'package:qatar_ui_app/screen/app/drawer/faqs_screen.dart';
import 'package:qatar_ui_app/screen/app/drawer/tabs/info_screen.dart';
import 'package:qatar_ui_app/screen/app/register_screen.dart';
import 'package:qatar_ui_app/screen/launch_screen.dart';
import 'package:qatar_ui_app/screen/login_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/on_boarding_screen': (context) => const OnBoardingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/bottom_navigaion_screen': (context) => const BottomNavigationScreen(),
        '/chat_screen': (context) => const ChatScreen(),
        '/info_screen': (context) => const InfoScreen(),
        '/faqs_screen': (context) => const FaqsScreen(),
      },
    );
  }
}