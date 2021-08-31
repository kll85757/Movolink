import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:route_transitions_do/route_transitions_do.dart';
import 'package:MovoLink/views/deviceInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPage();
  }
}

class ListPage extends State<DeviceList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //浮动按钮
      // floatingActionButton: FloatingActionButton(
      //   child: Text('返回'),
      //   onPressed: () {
      //     Navigator.of(context).pop();
      //   },
      // ),
      // appBar: AppBar(title: Text('荷受・配完'),),
      appBar: null,
      body: HomePage(),
    );
  }
}

Widget titleSection = Container(
  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
  color: Colors.transparent,
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 400,
                height: 50,
                child: Container(
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: new Offset(3, 3),
                        blurRadius: 20,
                      )
                    ],
                    // border: Border.all(
                    //   color: Colors.green, width: 2.0
                    // )
                  ),

                  ///距离顶部
                  margin: EdgeInsets.only(top: 0),
                  padding: EdgeInsets.all(0),

                  ///Alignment 用来对齐 Widget
                  alignment: Alignment(0, 0),
                  child: TextField(
                      cursorWidth: 1,
                      style: TextStyle(
                        fontSize: 14.0,
                        // height: 5,
                        color: Color(0xFF444444),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "输入型号或名称",
                        contentPadding: EdgeInsets.all(2),

                        ///设置输入文本框的提示文字的样式
                        hintStyle: TextStyle(color: Colors.grey, height: 2),
                        alignLabelWithHint: true,
                        hintMaxLines: 3,

                        ///输入框内的提示 输入框没有获取焦点时显示
                        // labelText: "",
                        // labelStyle: TextStyle(color: Color(0xFFe0e0e0)),
                        ///显示在输入框下面的文字
                        // helperText: "这里是帮助提示语",
                        // helperStyle: TextStyle(color: Colors.green),

                        ///显示在输入框下面的文字
                        ///会覆盖了 helperText 内容
                        // errorText: "这里是错误文本提示",
                        // errorStyle: TextStyle(color: Colors.red),

                        ///输入框获取焦点时才会显示出来 输入文本的前面
                        // prefixText: "prefix",
                        // prefixStyle: TextStyle(color: Colors.deepPurple),
                        ///输入框获取焦点时才会显示出来 输入文本的后面
                        // suffixText: "suf ",
                        // suffixStyle: TextStyle(color: Colors.black),

                        ///文本输入框右下角显示的文本
                        ///文字计数器默认使用
                        // counterText: "count",
                        // counterStyle:TextStyle(color: Colors.deepPurple[800]),

                        ///输入文字前的小图标
                        prefixIcon: Icon(Icons.search),

                        ///输入文字后面的小图标
                        // suffixIcon: Icon(Icons.close),
                        border: OutlineInputBorder(
                          ///设置边框四个角的弧度
                          borderRadius: BorderRadius.all(Radius.circular(10)),

                          ///用来配置边框的样式
                          borderSide: BorderSide.none,
                          // borderSide: null
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      )),
                )),
            Container(
              margin: EdgeInsets.only(top: 20),
              color: Colors.transparent,
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Expanded(
                child: Text(
                  'All Device',
                  maxLines: 4,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF67A419),
                  ),
                ),
              ),
            ),
            Text(
              '匹配到的设备显示在这里',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);




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
      appBar: null,
      body: new Container(
        decoration: BoxDecoration(
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: new ExactAssetImage('assets/images/listBg.png'))),
        child: Container(
          color: Colors.transparent,
          // child: titleSection,
          child: Column(children: [
            Container(
              child: titleSection,
            ),
            Expanded(
                child: GridView.count(
              padding: EdgeInsets.fromLTRB(20, 14, 20, 20),
              //一行多少个
              crossAxisCount: 2,
              //滚动方向
              scrollDirection: Axis.vertical,
              // 左右间隔
              crossAxisSpacing: 20.0,
              // 上下间隔
              mainAxisSpacing: 20.0,
              //宽高比
              childAspectRatio: 2 / 2,
              //设置itemView
              children: initListWidget(context, MenuNun),
            ))
          ]),
        ),
      ),
      // body: GridView.count(
      //   padding: EdgeInsets.all(5.0),
      //   //一行多少个
      //   crossAxisCount: 2,
      //   //滚动方向
      //   scrollDirection: Axis.vertical,
      //   // 左右间隔
      //   crossAxisSpacing: 5.0,
      //   // 上下间隔
      //   mainAxisSpacing: 5.0,
      //   //宽高比
      //   childAspectRatio: 2 / 2,
      //   //设置itemView
      //   children: initListWidget(context, MenuNun),
      // )
    );
  }
}

List<String> MenuNun = [
  'Battery 01',
  'Battery 02',
  'Battery 03',
  'Battery 04',
  '5',
  '6',
  '7',
  '8',
  '8',
  '9'
];

List<Widget> initListWidget(BuildContext context, List<String> MenuNun) {
  List<Widget> lists = [];
  for (var item in MenuNun) {
    lists.add(
      new Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: new Offset(3, 3),
                  blurRadius: 18,
                )
              ],
              border: null,
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          height: 50.0,
          width: 50.0,
          child: new Center(
            child: listItem(context, item),
          )),
    );
  }
  return lists;
}

//宫格菜单Widget
Widget listItem(BuildContext context, String menuText) {
  var title = menuText;
  return Card(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
    child: InkWell(
        splashColor: Colors.lightGreen,
        // focusColor: Colors.lightGreenAccent,
        hoverColor: Colors.pink,
        // highlightColor: Color(0xFFE0E0E0),
        borderRadius: new BorderRadius.circular(25.0),
        onTap: () {
          _goToInfo(context, title);
        },
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Padding(padding: EdgeInsets.only(top: 0)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 13)),
                Image(
                  image: AssetImage('assets/images/BatteryFull.png'),
                  height: 45,
                  width: 40,
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                Text(
                  '100%',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 13)),
                // Image(
                //   image: AssetImage('assets/images/BatteryFull.png'),
                //   height: 45,
                //   width: 40,
                // ),
                Text(
                  title.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 13)),
                Padding(padding: EdgeInsets.only(top: 5)),
                // Image(
                //   image: AssetImage('assets/images/BatteryFull.png'),
                //   height: 45,
                //   width: 40,
                // ),
                Text(
                  '充电完成',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Flexible(
              flex: 7,
              fit: FlexFit.loose,
              child: Container(
                margin: EdgeInsets.all(5.0),
                // child: Text("000000000000000"),
                color: Colors.transparent,
              ),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  // Padding(padding: EdgeInsets.only(top: 60)),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  // Padding(padding: EdgeInsets.only(left: 80)),
                  // Padding(padding: EdgeInsets.only(top: 10)),
                  // Image(
                  //   image: AssetImage('assets/images/BatteryFull.png'),
                  //   height: 45,
                  //   width: 40,
                  // ),
                  // Flexible(
                  //   flex: 1,
                  //   child: Container(
                  //     margin: EdgeInsets.all(5.0),
                  //     child: Text("000000000000000"),
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  Flexible(
                    flex: 7,
                    fit: FlexFit.loose,
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      // child: Text("000000000000000"),
                      color: Colors.transparent,
                    ),
                  ),
                  Align(
                      // widthFactor: 2,
                      // heightFactor: 2,
                      alignment: Alignment.bottomLeft,
                      child: Image(
                        image: AssetImage('assets/images/happy.png'),
                        height: 40,
                        width: 40,
                      )),
                  Padding(padding: EdgeInsets.only(left: 5)),
                ],
              ),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 5)),
              ],
            )
          ],
        ))),
  );
}

void _goToInfo(BuildContext context, title) {
  Navigator.pushNamed(context, '/deviceInfo');
  setState() {}
  
  // RouteTransitionDo(
  //     context: context, // BuildContext
  //     animationType: AnimationType.fadeIn, // Animation you want
  //     child: Info() // Page to go
  // );
  // if (title == '入出庫登録') {
  //   Navigator.pushNamed(context, '/StockManager');
  // } else if (title == 'Welcome') {
  //   Navigator.pushNamed(context, '/2');
  // } else if (title == '紐づけ') {
  //   Navigator.pushNamed(context, '/3');
  // } else if (title == '荷受・配完') {
  //   Navigator.pushNamed(context, '/4');
  // }
  // print({new DateTime.now()});
  return;
}
