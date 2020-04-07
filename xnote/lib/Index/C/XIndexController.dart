import 'package:flutter/material.dart';
import 'package:xnote/Folder/Widget/XNoteFoldWidget.dart';
import 'package:xnote/Page/Widget/XNotePageWidget.dart';
import 'package:xnote/Detail/Widget/XNoteDetailWidget.dart';

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
    return Material(
      type: MaterialType.transparency,
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: 200,
              child: XNoteFoldWidget(),
            ),
            Container(
              width: 200,
              child: XNotePageWidget(),
            ),
            Expanded(
              child: XNoteDetailWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
