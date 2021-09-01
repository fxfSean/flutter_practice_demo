
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with AutomaticKeepAliveClientMixin {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          setState(() {
            count++;
          });
        },
        child: Center(
          child: Text('First $count'),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
