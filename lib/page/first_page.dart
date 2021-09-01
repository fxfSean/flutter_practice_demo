import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/component/item_list_view.dart';
import 'package:flutter_practice_demo/model/item_bean.dart';
import 'package:flutter_practice_demo/model/list_view_mixin.dart';
import 'package:flutter_practice_demo/model/mock_data.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with AutomaticKeepAliveClientMixin, ListViewMixin<FirstPage> {
  List<ItemBean> listData = MockData.getItemBeansFirst();

  @override
  bool get wantKeepAlive => true;
}


