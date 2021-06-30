import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:MovoLink/webService.dart';

//入出库



class StockManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StockManagerPage();
  }
}

class StockManagerPage extends State<StockManager> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //浮动按钮
        floatingActionButton: FloatingActionButton(
          child: Text('返回'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      appBar: AppBar(title: Text('入出庫登録'),),
      body: Container(
        child: ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Text('get'),
              color: Colors.blue,
              onPressed: () {
                getUserInfo();

              },
            ),
            FlatButton(
              child: Text('post'),
              color: Colors.blue,
              onPressed: () {

              },
            ),
            FlatButton(
              child: Text('送信'),
              color: Colors.blue,

              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

