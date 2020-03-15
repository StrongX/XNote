import 'XNoteFoldItemModel.dart';

class XNoteFoldItemManage {
  static List getDemoList() {
    var item1 = XNoteFoldItemModel();
    item1.name = '文件夹1';

    var item2 = XNoteFoldItemModel();
    item2.name = '文件夹2';

    var item3 = XNoteFoldItemModel();
    item3.name = '文件夹3';

    var item4 = XNoteFoldItemModel();
    item4.name = '文件夹4';

    var item5 = XNoteFoldItemModel();
    item5.name = '字很多多多多多，字很多多多多多，字很多多多多多----字很多多多多多，字很多多多多多，字很多多多多多，字很多多多多多';

    var list = [item1,item2,item3,item4,item5];
    return list;
  }
}
