import 'package:flutter/material.dart';
import 'package:intel_demo/Widgets/design.dart';
import 'package:intel_demo/Widgets/menu.dart';
import 'package:intel_demo/Widgets/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Info-Demo"),
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor),
      drawer: const Menu(),
      backgroundColor: Theme.of(context).cursorColor,
      body: Builder(
        builder: (context) =>
      SingleChildScrollView(
        child: Container(
          color: Theme.of(context).cursorColor,
          child: Column(
            children: [
              const SizedBox(height: 70),
              Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          size: 50, color: Theme.of(context).buttonColor,
        ),
      ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Please fill-in your personal Information: ",
                        style: ThemeStyling.infoHeader),
                    const SizedBox(height: 20),
                    Card(
                      elevation: 5,
                      child: Container(
                        color: Theme.of(context).cursorColor,
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  maxLength: 20,
                                  controller: _name,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    hintText: 'Enter your name',
                                    labelText: 'Name',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter valid name';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  maxLength: 10,
                                  controller: _phone,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.phone),
                                    hintText: 'Enter a phone number',
                                    labelText: 'Phone',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter valid phone number';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  maxLength: 20,
                                  controller: _email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.mail),
                                    hintText: 'Enter your email',
                                    labelText: 'Email',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter valid email';
                                    }
                                    return null;
                                  },
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 150.0, top: 40.0),
                                    child: RaisedButton(
                                      child: const Text('Submit'),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                           Scaffold.of(context).showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Data is in processing.')));
                                          SharedPreferences.getInstance().then(
                                            (prefs) {
                                              prefs.setString('email',
                                                  _email.text);
                                              prefs.setString('name', _name.text);
                                              prefs.setString('phone', _phone.text);
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DesignScreen()));
                                            },
                                          );                                         
                                        }
                                       
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
