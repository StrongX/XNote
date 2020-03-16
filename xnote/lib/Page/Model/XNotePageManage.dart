import 'XNotePageItemModel.dart';

class XNotePageManage {
  static List getDemoList() {
    var item1 = XNotePageItemModel();
    item1.name = '文章1';

    var item2 = XNotePageItemModel();
    item2.name = '文章2';

    var item3 = XNotePageItemModel();
    item3.name = '文章3';

    var item4 = XNotePageItemModel();
    item4.name = '文章4';

    var item5 = XNotePageItemModel();
    item5.name = '字很多多多多多，字很多多多多多，字很多多多多多----字很多多多多多，字很多多多多多，字很多多多多多，字很多多多多多';

    var list = [item1,item2,item3,item4,item5];
    return list;
  }
}
