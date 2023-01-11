import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intel_demo/Widgets/info.dart';
import 'package:intel_demo/Widgets/menu.dart';
import 'package:intel_demo/Widgets/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({Key? key}) : super(key: key);

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
   String _name = '';
   String _email = '';
   String _phone = '';
  @override
  void initState() {
    getInfoData();
    super.initState();
  }

  getInfoData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var name = _prefs.getString("name");
    var phone = _prefs.getString("phone");
    var email = _prefs.getString("email");
    setState(() {
      _name = name!;
      _phone = phone!;
      _email = email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Design - Demo"),
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
              const Text("Personal Information: ",
                        style: ThemeStyling.infoHeader),
                    const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Theme.of(context).backgroundColor, width: 3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  shadowColor: Colors.green[100],
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(Icons.info_outlined,
                              color: Theme.of(context).buttonColor, size: 35),
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Name : ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: _name,
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor, fontSize: 18),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {})
                                ])),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Phone Number : ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: _phone,
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor, fontSize: 18),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {})
                                ])),
                          ),
                              Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                                text: TextSpan(
                                    text: 'Email : ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: _email,
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor, fontSize: 18),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {})
                                ])),
                          ),
                            ],
                          ),
                        ),

                        Center(child: TextButton.icon(onPressed: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const InfoScreen()));
                        }, icon: const Icon(Icons.edit), label: const Text('Edit Profile')))
                        
                      ]),
                ),
              ),
              Center(
        child: LoadingAnimationWidget.threeRotatingDots(
          color: Theme.of(context).buttonColor,
          size: 100,
        )),
            ],
          ),
        ),
      ),
    );
  }
}
