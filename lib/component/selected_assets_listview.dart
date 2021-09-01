
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/model/item_bean.dart';

class SelectedAssetsListView extends StatelessWidget {
  final ValueNotifier<bool> disPlayingDetail;
  final List<ItemBean> selectedBeans;
  final Function(ItemBean itemBean) removeData;

  const SelectedAssetsListView({Key? key,
    required this.disPlayingDetail,
    required this.selectedBeans,
    required this.removeData,
  })
      : super(key: key);

  Widget _selectedItemWidget(int index) {
    return ValueListenableBuilder(
      valueListenable: disPlayingDetail,
      builder: (_, bool value, __) {
        return  GestureDetector(
          onTap: () => removeData(selectedBeans[index]),
          child: Container(
            color: Colors.blue,
            child: Center(
                child: AnimatedDefaultTextStyle(
                  duration: kThemeAnimationDuration,
                  style: TextStyle(fontSize: value ? 10: 5,color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                    Text(selectedBeans[index].title,),
                    SizedBox(height: value ? 12: 5,),
                    Text(selectedBeans[index].icon,)
                  ],),
                )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: disPlayingDetail,
      builder: (_, bool value, __) => AnimatedContainer(duration: kThemeAnimationDuration,
        curve: Curves.easeInOut,
        height: value ? 120: 80,
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                if(selectedBeans.isNotEmpty) {
                  disPlayingDetail.value = !disPlayingDetail.value;
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Selected Item'),
                  Icon(value ? Icons.arrow_downward : Icons.arrow_upward, size: 18,),
                ],
              ),
            ),
            Expanded(child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
                itemCount: selectedBeans.length,
                itemBuilder: (context, index) {
              return Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: _selectedItemWidget(index),
                ),
              );
            })),
          ],
        ),
      )
    );
  }
}
