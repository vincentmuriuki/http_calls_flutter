import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(RealWorddApp());
}

class RealWorddApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RealWorldState();
  }
}

class RealWorldState extends State<RealWorddApp> {
  var _isLoading = true;
  // Variable defined with the underscore makes the variable private

  _fetchData() async {
    print('Attempting to fetch data');

    final url = 'https://api.letsbuildthatapp.com/youtube/home_feed';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(response.body);

      final map = json.decode(response.body);
      final videosJson = map["videos"];
      videosJson.forEach((video) {
        print(video["name"]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Real World App Bar"),
        actions: [
          new IconButton(
              onPressed: () {
                print("reloading..");
                setState(() {
                  _isLoading = false;
                });
                _fetchData();
              },
              icon: new Icon(Icons.refresh))
        ],
      ),
      body: new Center(
          child: _isLoading
              ? new CircularProgressIndicator()
              : new Text("FInished loading..")),
    ));
  }
}
