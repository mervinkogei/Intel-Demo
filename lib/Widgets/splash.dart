import 'package:flutter/material.dart';
import 'package:intel_demo/Widgets/home.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Widget currentScreenWidget = const Home();


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: currentScreenWidget,
      duration: 3100,
      imageSize: 130,
      imageSrc: "images/logo.png",
      text: 'Welcome to Intel-Demo',
      textType: TextType.NormalText,
      textStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
      backgroundColor: Theme.of(context).backgroundColor
    );
  }
}