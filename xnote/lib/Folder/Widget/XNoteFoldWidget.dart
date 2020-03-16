import 'package:flutter/material.dart';

import 'XNoteFoldItemWidget.dart';
import 'XNoteFoldAddWidget.dart';

import 'package:xnote/Folder/Model/XNoteFoldManage.dart';
import 'package:xnote/Folder/Model/XNoteFoldItemModel.dart';
import 'package:xnote/Common/Widget/Dialog/XNoteInputDialogWidget.dart';

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
    _dataSource = XNoteFoldManage.getDemoList();
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
    XNoteInputDialogWidget.showInputDialog(
        context: context,
        title: "文件夹名",
        callBack: (String title) {
          _dataSource.insert(0, XNoteFoldItemModel(name: title));
          _listKey.currentState.insertItem(1);
        });
  }
}
