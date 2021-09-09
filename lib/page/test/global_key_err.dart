
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalKeyErrPage extends StatefulWidget {

  const GlobalKeyErrPage({Key? key}) : super(key: key);

  @override
  GlobalKeyErrPageState createState() => GlobalKeyErrPageState();
}

class GlobalKeyErrPageState extends State<GlobalKeyErrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlobalKeyErrPage'),
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
