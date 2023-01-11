import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intel_demo/Widgets/menu.dart';

class ResponseScreen extends StatefulWidget {
  const ResponseScreen({Key? key}) : super(key: key);

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
 

  Future<List<Posts>> getRequest() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    List<Posts> users = [];
    for (var singleUser in responseData) {
      Posts user = Posts(
          id: singleUser["id"],
          userId: singleUser["userId"],
          title: singleUser["title"],
          body: singleUser["body"]);
      users.add(user);
    }
    return users;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Response-Demo"),
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor),
      drawer: const Menu(),
      backgroundColor: Theme.of(context).cursorColor,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: getRequest(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child:  Center(child: CircularProgressIndicator()),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(snapshot.data[index].title),
                      ),
                      subtitle: Text(snapshot.data[index].body),
                      contentPadding: const EdgeInsets.only(bottom: 20.0),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Posts {
  int? id;
  int? userId;
  String? title;
  String? body;

  Posts({
    this.id,
    this.userId,
    this.title,
    this.body,
  });
}
