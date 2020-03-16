import 'package:flutter/material.dart';
import 'XNotePageItemWidget.dart';
import 'package:xnote/Page/Model/XNotePageManage.dart';
import 'package:xnote/Page/Model/XNotePageItemModel.dart';
import 'XNotePageAddWidget.dart';

class XNotePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return XNotePageWidgetState();
  }
}

class XNotePageWidgetState extends State<XNotePageWidget> {
  var _dataSource = List<XNotePageItemModel>();
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _dataSource = XNotePageManage.getDemoList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue,
      child: AnimatedList(
        key: _listKey,
        itemBuilder: _itemBuilder,
        initialItemCount: _dataSource.length + 1,
      ),
    );
  }

  Widget _itemBuilder(
      BuildContext context, int index, Animation<double> animation) {
    if (index == 0) {
      return XNotePageAddWidget(
        animation: animation,
        onTap: addFoldAction,
      );
    } else {
      return XNotePageItemWidget(
        animation: animation,
        model: _dataSource[index - 1],
      );
    }
  }

  void addFoldAction() {
    _dataSource.insert(
        0, XNotePageItemModel(name: '文章${_dataSource.length}'));
    _listKey.currentState.insertItem(1);
  }
}
