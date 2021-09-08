

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_demo/page/return_value_page.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  var backValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Third ${backValue ?? ""}'),
          onPressed: () async {
              backValue = await Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ReturnValuePage()));
              setState(() {

              });
          },
        ),
      ),
    );
  }
}
