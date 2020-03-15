import 'package:flutter/material.dart';
import 'package:xnote/Folder/Model/XNoteFoldItemModel.dart';

class XNoteFoldItemWidget extends StatefulWidget {
  XNoteFoldItemModel model;
  final Animation<double> animation;

  XNoteFoldItemWidget({Key key,this.model,@required this.animation});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return XNoteFoldItemWidgetState();
  }
}

class XNoteFoldItemWidgetState extends State<XNoteFoldItemWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizeTransition(
      sizeFactor: widget.animation,
      axis: Axis.vertical,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 119,
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Text(
                  widget.model.name,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
