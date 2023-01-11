import 'package:flutter/material.dart';
import 'package:intel_demo/Widgets/info.dart';
import 'package:intel_demo/Widgets/menu.dart';
import 'package:intel_demo/Widgets/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Intel-Demo"),
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor),
      drawer: const Menu(),
      backgroundColor: Theme.of(context).cursorColor,
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).cursorColor,
          child: Column(
            children: [
              const SizedBox(height: 130),
              Center(
                child: LoadingAnimationWidget.flickr(
                  leftDotColor: Theme.of(context).backgroundColor,
                  rightDotColor: Theme.of(context).buttonColor,
                  size: 200,
                ),
              ),
              const Center(
                child: Text('Welcome to Intel-Demo', style: ThemeStyling.welcome,),
              ),

              const SizedBox(height: 70),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).buttonColor
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Menu()));
                }, child: const Text("Click Here to Start"))
            ],
          ),
        ),
      ),
    );
  }
}
