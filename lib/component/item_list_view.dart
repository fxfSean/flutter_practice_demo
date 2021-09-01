

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/model/item_bean.dart';
import 'package:flutter_practice_demo/model/mock_data.dart';

class ItemListView extends StatefulWidget {
  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  List<ItemBean> listData = MockData.getItemBeans();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ).copyWith(bottom: 10),
      child: Scrollbar(
          radius: Radius.circular(99),
          isAlwaysShown: true,
          child: ListView.builder(itemCount: listData.length, itemBuilder: itemBuilder)),
    );
  }


  Widget itemBuilder(context, index) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(2),
              width: 48,
              height: 48,
              child: Center(
                  child: Text(
                    listData[index].icon,
                    style: TextStyle(fontSize: 24),
                  )),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listData[index].title,
                      style: Theme.of(context).textTheme.headline6,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      listData[index].description,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                )),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

}