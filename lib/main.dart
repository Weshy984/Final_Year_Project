import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiqiti/auth/signin.dart';
import 'package:tiqiti/auth/signup.dart';
import 'package:tiqiti/screens/bottom_bar.dart';
import 'package:tiqiti/screens/home_screen.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiqiti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home:AnimatedSplashScreen(
          splash:SizedBox(
            child: SvgPicture.asset('assets/images/Frame.svg',
              semanticsLabel: 'Logo',),
          ),
          duration: 1500,
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: const Color(0xFFF1FAEE),
          nextScreen: const SignUpScreen()),
      routes: {
        '/login':(context)=> const SignIn(),
        '/signUp':(context)=> const SignUpScreen(),
        '/home':(context)=> const HomeScreen(),
        '/bottomBar':(context)=>const BottomBar(),
      },
    );
  }
}

