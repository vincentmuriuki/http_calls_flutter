import 'package:flutter/material.dart';

class VideoCell extends StatelessWidget {
  final video;

// Constructor that helps initialize what you pass for the property video
  VideoCell(this.video);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Container(
            padding: new EdgeInsets.all(16.0),
            child: new Column(
              // Align text to the start of axis: left
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Image.network(video["imageUrl"]),
                new Container(height: 8.0),
                new Text(
                  video["name"],
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        new Divider()
      ],
    );
  }
}
