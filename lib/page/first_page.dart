import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/component/item_list_view.dart';
import 'package:flutter_practice_demo/model/item_bean.dart';
import 'package:flutter_practice_demo/model/mock_data.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with AutomaticKeepAliveClientMixin {
  List<ItemBean> listData = MockData.getItemBeans();

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

  @override
  bool get wantKeepAlive => true;
}


