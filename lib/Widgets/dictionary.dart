import 'package:flutter/material.dart';
import 'package:intel_demo/Widgets/menu.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {

  @override
  void initState() {
    super.initState();
  }
  List dictionary = [{
    "2": "two",
    "3": "three",
    "6": "six",
    "8": "eight",
    "9": "nine",
    "21": "twenty-one",
    "34": "thirty-four",
    "61": "sixty-one",
    "80": "eighty",
    "81": "eighty-one",
    "90": "ninety",
    "91": "ninety-one",
    "Ninety-Nine": "99",
    "nine-hundred": "900"
}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Dictionary - Demo"),
            centerTitle: true,
            backgroundColor: Theme.of(context).backgroundColor),
        drawer: const Menu(),
        backgroundColor: Theme.of(context).cursorColor,
        body: ListView.builder(
                itemCount: dictionary.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dictionary[index]),
                      ),
                      contentPadding: const EdgeInsets.only(bottom: 20.0),
                    ),
                  ),
                ),
              ));
  }
}

class Data {
  String? s2;
  String? s3;
  String? s6;
  String? s8;
  String? s9;
  String? s21;
  String? s34;
  String? s61;
  String? s80;
  String? s81;
  String? s90;
  String? s91;
  String? ninetyNine;
  String? nineHundred;

  Data(
      {this.s2,
      this.s3,
      this.s6,
      this.s8,
      this.s9,
      this.s21,
      this.s34,
      this.s61,
      this.s80,
      this.s81,
      this.s90,
      this.s91,
      this.ninetyNine,
      this.nineHundred});
}