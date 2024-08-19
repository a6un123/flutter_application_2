import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/loginscreen/login_screen.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
  Future.delayed(Duration(seconds: 3)).then(
    (value) {
      return Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    },
  );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 151, 211),
      body: Center(
        child: LottieBuilder.asset("assets/animation/todo logo.json")
      ),
    );
  }
}