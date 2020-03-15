import 'package:flutter/material.dart';
import 'package:xnote/Folder/Widget/XNoteFoldWidget.dart';

class XNoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "多多笔记",
      home: XIndexWidget(),
    );
  }
}

class XIndexWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return XIndexWidgetState();
  }
}

class XIndexWidgetState extends State<XIndexWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("多多笔记"),
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 200,
            child: XNoteFoldWidget(),
          ),
          Container(
            color: Colors.blue,
            width: 200,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
