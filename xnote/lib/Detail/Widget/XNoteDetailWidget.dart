import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:xnote/Detail/Model/XNoteDetailManage.dart';

class XNoteDetailWidget extends StatelessWidget {
  var markdownData;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final controller = ScrollController();
    markdownData = XNoteDetailManage.getDemoMarkdown();
    return Container(
      child: Markdown(
        controller: controller,
        selectable: true,
        data: markdownData,
      ),
      color: Colors.white,
    );
  }
}
