import 'package:flutter/material.dart';
import 'package:MovoLink/StockManager.dart';
import 'package:MovoLink/welcome.dart';
import 'package:MovoLink/deviceInfo.dart';
import 'package:MovoLink/deviceList.dart';

void main()=> runApp(RootArea());

class RootArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',  //配置默认访问路径
      home: HomePage(),
        routes: {
          //需要使用context指定上下文
          '/StockManager': (context) => StockManager(),//入出库
          '/welcome': (context) => welcome(),//紐づけ
          '/deviceInfo': (context) => Info(),//
          '/deviceList': (context) => KS(),//
        },
    );
  }
}

//配置路由规则
//final routes = {
//  '/': (context) => Main(),
//  '/StockManager': (context) => StockManager(),//入出库
////  '/page2': (context) => Page2(),
////  '/page3': (context) => Page3(),
//};




class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListState();
  }
}

class ListState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Movolink页面列表'),),
      body: GridView.count(
          padding: EdgeInsets.all(5.0),
          //一行多少个
          crossAxisCount: 2,
          //滚动方向
          scrollDirection: Axis.vertical,
          // 左右间隔
          crossAxisSpacing: 5.0,
          // 上下间隔
          mainAxisSpacing: 5.0,
          //宽高比
          childAspectRatio: 2 / 2,
          //设置itemView
          children: initListWidget(context,MenuNun),
      )
    );
  }
}

List<String> MenuNun = ['入出庫登録','Welcome','紐づけ','设备列表'];

List<Widget> initListWidget(BuildContext context, List<String> MenuNun) {
  List<Widget> lists = [];
  for (var item in MenuNun) {
    lists.add(
      new Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
              color: Colors.black12,
              offset: new Offset(5.0, 5.0),
              blurRadius: 10.0,
              )
            ],
            border: null,
            borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          height: 50.0,
          width: 50.0,
          child: new Center(
              child: listItem(context,item),
          )
        ),
      );
    }
  return lists;
}

//宫格菜单Widget
Widget listItem(BuildContext context,String menuText){
  var title = menuText;
  return Card(

    child: InkWell(
      splashColor: Colors.pinkAccent.withAlpha(50),
      onTap: (){
        _goToPage(context,title);
      },
      child: new Center(
//            child: new Text(title.toString()
            child:  Text(
              title.toString(),
              style: TextStyle(
//                fontWeight: FontWeight.normal,
//                fontSize: 18,
              ),
            ),
        )
    ),
  );
}

void _goToPage(BuildContext context,title){
  if(title == '入出庫登録'){
    Navigator.pushNamed(context, '/StockManager');
  }else if(title == 'Welcome'){
    Navigator.pushNamed(context, '/welcome');
  }else if(title == '紐づけ'){
    Navigator.pushNamed(context, '/3');
  }else if(title == '设备列表'){
    Navigator.pushNamed(context, '/deviceList');
  }
  print({new DateTime.now()});
  return;
}
