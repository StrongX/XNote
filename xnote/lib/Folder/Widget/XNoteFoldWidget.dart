import 'package:flutter/material.dart';
import 'XNoteFoldItemWidget.dart';
import 'package:xnote/Folder/Model/XNoteFoldItemManage.dart';
import 'package:xnote/Folder/Model/XNoteFoldItemModel.dart';
import 'XNoteFoldAddWidget.dart';

class XNoteFoldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return XNoteFolderWidgetState();
  }
}

class XNoteFolderWidgetState extends State<XNoteFoldWidget> {
  var _dataSource = List<XNoteFoldItemModel>();
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _dataSource = XNoteFoldItemManage.getDemoList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
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
      return XNoteFoldAddWidget(
        animation: animation,
        onTap: addFoldAction,
      );
    } else {
      return XNoteFoldItemWidget(
        animation: animation,
        model: _dataSource[index - 1],
      );
    }
  }

  void addFoldAction() {
    _dataSource.insert(
        0, XNoteFoldItemModel(name: '文件夹${_dataSource.length}'));
    _listKey.currentState.insertItem(1);
  }
}
