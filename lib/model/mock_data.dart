
import 'package:flutter_practice_demo/model/item_bean.dart';

class MockData {

  static List<ItemBean> getItemBeansFirst() {
    var itemBeans = <ItemBean>[];
    for (var i = 0; i < 20; i++) {
      itemBeans.add(ItemBean(icon: "⚽", title: "Page One $i", description: "current item is $i"));
    }
    return itemBeans;
  }

  static List<ItemBean> getItemBeansSecond() {
    var itemBeans = <ItemBean>[];
    for (var i = 0; i < 20; i++) {
      itemBeans.add(ItemBean(icon: "⛪", title: "Page Two $i", description: "current item is $i"));
    }
    return itemBeans;
  }


}