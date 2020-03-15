import 'package:flutter/material.dart';

class XNoteFoldAddWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final Animation<double> animation;

  XNoteFoldAddWidget({Key key, @required this.onTap, @required this.animation});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: SizedBox(
        height: 90,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 89,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 8, 0),
                      child: Icon(
                        Icons.create_new_folder,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '新建分类',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            )
          ],
        ),
      ),
      onTap: this.onTap,
    );
  }
}
