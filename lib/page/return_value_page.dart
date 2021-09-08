
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReturnValuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReturnValue'),
      ),
      body: Center(
        child: TextButton(
          child: Text('返回value：3'),
          onPressed: (){
            Navigator.of(context).pop(3);
          },
        ),
      ),

    );
  }
}
