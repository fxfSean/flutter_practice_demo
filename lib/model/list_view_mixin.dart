
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/component/item_list_view.dart';
import 'package:flutter_practice_demo/component/selected_assets_listview.dart';
import 'package:flutter_practice_demo/model/item_bean.dart';
import 'package:flutter_practice_demo/src/assets/widget/assets_picker.dart';

mixin ListViewMixin<T extends StatefulWidget> on State<T> {
  List<ItemBean> get listData;
  List<ItemBean> selectedData = <ItemBean>[];
  final ValueNotifier<bool> disPlayingDetail = ValueNotifier(true);

  void selectItem(ItemBean itemBean) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AssetsPicker()));
    print('Click item: ${itemBean.title}');
    if (!selectedData.contains(itemBean)){
      selectedData.add(itemBean);
      setState(() {
      });
    }
  }

  void removeData(ItemBean itemBean) {
    selectedData.remove(itemBean);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
            child: ItemListView(
              listData: listData,
              onSelectedMethod: selectItem,
            )
        ),
        if(selectedData.isNotEmpty)
          SelectedAssetsListView(
            disPlayingDetail: disPlayingDetail,
            selectedBeans: selectedData,
            removeData: removeData,
          ),
      ],
    );
  }
}