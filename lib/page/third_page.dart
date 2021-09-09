

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/page/return_value_page.dart';
import 'package:flutter_practice_demo/page/test/global_key_err.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

GlobalKey<GlobalKeyErrPageState> _globalKey = GlobalKey();

class _ThirdPageState extends State<ThirdPage> {
  var backValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Third ${backValue ?? ""}'),
          onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(builder: (_)=> GlobalKeyErrPage(key: _globalKey,)));
          },
        ),
      ),
    );
  }
}
