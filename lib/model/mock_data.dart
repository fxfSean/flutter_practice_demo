
import 'package:flutter_practice_demo/model/item_bean.dart';

class MockData {
  static final itemBeans = <ItemBean>[
  ];

  static List<ItemBean> getItemBeans() {
    for (var i = 0; i < 20; i++) {
      itemBeans.add(ItemBean(icon: "⚽", title: "Item $i", description: "current item is $i"));
    }
    return itemBeans;
  }
}