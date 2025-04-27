import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/view/screens/main-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/splash.json',
        onLoaded: (composition){
          Future.delayed(composition.duration,(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
          });
        }
        ),
      ),
    );
  }
}
