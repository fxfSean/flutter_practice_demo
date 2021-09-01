

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/model/item_bean.dart';
import 'package:flutter_practice_demo/model/list_view_mixin.dart';
import 'package:flutter_practice_demo/model/mock_data.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with
    AutomaticKeepAliveClientMixin, ListViewMixin<SecondPage>{
  @override
  List<ItemBean> get listData => MockData.getItemBeansSecond();

  @override
  bool get wantKeepAlive => true;

}
