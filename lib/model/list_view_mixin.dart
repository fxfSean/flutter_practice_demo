
import 'package:flutter/cupertino.dart';
import 'package:flutter_practice_demo/component/item_list_view.dart';
import 'package:flutter_practice_demo/model/item_bean.dart';

mixin ListViewMixin<T extends StatefulWidget> on State<T> {
  List<ItemBean> get listData;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
            child: ItemListView(listData: listData,)
        )
      ],
    );
  }
}