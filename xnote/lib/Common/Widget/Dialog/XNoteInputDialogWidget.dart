import 'package:flutter/material.dart';

typedef XNoteInputDialogCallBack = void Function(String text);

class XNoteInputDialogWidget extends StatelessWidget {
  final String title;
  final XNoteInputDialogCallBack callBack;

  XNoteInputDialogWidget(
      {Key key, @required this.title, @required this.callBack});

  static void showInputDialog(
      {@required context: BuildContext,
      @required title: String,
      @required callBack: XNoteInputDialogCallBack}) {
    showDialog(
      context: context,
      child: XNoteInputDialogWidget(
        title: title,
        callBack: callBack,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      child: Container(
        height: 90,
        width: 300,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: Text(
                this.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: TextField(
                  autofocus: true,
                  onSubmitted: (String text) {
                    this.callBack(text);
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
