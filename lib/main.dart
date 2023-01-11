import 'package:flutter/material.dart';
import 'package:intel_demo/Widgets/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: const Color(0xff7762FF),
        // ignore: deprecated_member_use
        buttonColor: const Color(0xffD662FF),
        cursorColor: const Color(0xffFFFFFF),
        fontFamily: 'Roboto',
        highlightColor: const Color(0xffF8D084),
        canvasColor: const Color(0xff000000),
        hintColor: const Color(0xff7762FF),
        cardColor: const Color(0xffC4C4C4),
        focusColor: const Color(0xffF4EFFF),
        errorColor: const Color(0xffFB0808),
        hoverColor: const Color(0xff616161),
        textSelectionColor: const Color(0xff979797),
        splashColor: const Color(0xff1B2021),
        shadowColor: const Color(0xffDACBFA),
        selectedRowColor: const Color(0xff8370FF),
        bottomAppBarColor: const Color(0xffE0E0E0),
        primaryColor: const Color(0xff433699),
        primaryColorLight: const Color(0xffCEBAF8),
        toggleableActiveColor: const Color(0xff00C52B),
        textSelectionHandleColor: const Color(0xffE3D4FF),
        primaryColorDark: const Color(0xffFF6262),
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}


