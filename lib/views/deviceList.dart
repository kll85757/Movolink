import 'dart:async';

import 'dart:io';
import 'package:MovoLink/utils/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:route_transitions_do/route_transitions_do.dart';
import 'package:MovoLink/views/deviceInfo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:progresso/progresso.dart';
import 'package:percent_indicator/percent_indicator.dart';


// class DataForSearch extends StatelessWidget {


@override
void initState() {
  //页面初始化
  // super.initState();
}

// List MenuNun;
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
List<String> allDeType = ['V口', '充电宝', '安东口', '储能电池'];
List TestData = [
  {
    "name": "Paradise🪐",
    "mData": {
      6: [
        1,
        1,
        16,
        16,
        1,
        3,
        16,
        80,
        2,
        30,
        96,
        0,
        45,
        00,
        00,
        00,
        68,
        1,
        56,
        84,
        50,
        53,
        86,
        79,
        52
      ]
    },
    "loc": "-59"
  },
  {
    "name": "WH-BLE 103",
    "mData": {
      6: [
        1,
        2,
        16,
        17,
        1,
        2,
        16,
        80,
        2,
        30,
        59,
        0,
        0,
        00,
        00,
        00,
        68,
        1,
        56,
        84,
        50,
        53,
        86,
        79,
        52
      ]
    },
    "loc": "-69"
  },
  {
    "name": "飓风V口电池",
    "mData": {
      6: [
        2,
        4,
        16,
        18,
        1,
        0,
        16,
        80,
        2,
        30,
        23,
        1,
        25,
        00,
        00,
        00,
        68,
        1,
        56,
        84,
        50,
        53,
        86,
        79,
        52
      ]
    },
    "loc": "-89"
  },
  {"name": "testdata1", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"},
  {"name": "testdata2", "mData": {}, "loc": "-87"}
];
List AllDeviceData;
List PickedData;
bool isDragging = false;


class DeviceList extends StatefulWidget {
  List deviceName;
  List data;
  DeviceList({this.deviceName, this.data});


  @override
  State<StatefulWidget> createState() {
    MenuNun = deviceName;
    AllDeviceData = data;
    // print(deviceName);
    // print(AllDeviceData);
    return ListPage();
  }
}

class ListPage extends State<DeviceList> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: null,
          body: HomePage(),
        ));
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
                      onChanged:(text){
                        print(text);
                        reSearch(text);
                      },
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
              child: Row(children: [
                Text(
                  'All Device',
                  maxLines: 4,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF67A419),
                  ),
                ),
              ]),
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

  void draggingToDel() {
    setState(() {

    });
  }

  bool _isTapped = false;
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
          height: MediaQuery.of(context).size.height,
          // child: titleSection,
          child: Column(children: [
            Container(
              child: titleSection,
            ),

            Expanded(
                flex: 1,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height -200,
                    // constraints: BoxConstraints.expand(),
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
                      children:
                          initListWidget(context, MenuNun, allDeType, TestData,_isTapped),
                    ),
                  )
              ],
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

// void stopSearch(BuildContext context) {
//   setState(() {
//     isSearchEnd = !isSearchEnd;
//   });
// }



class dragFakeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width - 20 * 3) / 2,
      width: (MediaQuery.of(context).size.width - 20 * 3) / 2,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: 
                 [
                    BoxShadow(
                      color: Colors.grey[200],
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                    ),
                  ],     
            border: Border.all(color: Colors.grey[200], width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(25.0))
        ),
        child: Center(
          child: Icon(
            FlutterIcons.copy_fea,
            color: Colors.grey[300  ],
            size: 50.sp,
          ),
        ),
    ),
    );
  }
}

List<Widget> initListWidget(BuildContext context, List<String> MenuNun, List<String> allDeType, List AllDeviceData,bool _istapped) {
  List<Widget> lists = [];
  bool istapped = _istapped;
  String data = '离婚';
  

  for (var item in AllDeviceData) {
    // print('${item['name']}');
    lists.add(
      new LongPressDraggable<String>(
        // axis: Axis.vertical,
        data: data,
        feedback: dragFakeItem(),
        childWhenDragging: AnimatedContainer(
          duration: Duration(seconds: 1),
          // height: 100.0,
          // width: 100.0,
          color: Colors.transparent,
          child: Center(
            // child:  Lottie.asset('assets/Mobilo/move.json', width: 100.sp)
          ),
        ),
        onDragStarted: (){
          print('onDraggableStart');
          isDragging = true;
        },
        onDragCompleted: (){
          print('onDrag');

        },
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          print('onDraggableCanceled');
        
        },
        onDragEnd: (DraggableDetails details) {
          print('onDragEnd');
          
        },
        child: Container(
            // duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: !istapped ? [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                ),
                ]:null,
                border: null,
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            // height: 50.0,
            // width: 50.0,
            
            child: new Center(
              child: listItem(context, item['name'], item['loc'], item),
            )
        ),
      )
    );
  }
  return lists;
}

//宫格菜单Widget
Widget listItem(
    BuildContext context, String menuText, String deType, Map Mdata) {
  var title = menuText,
      Mindex = 11,
      MDatas = Mdata['mData'].toString().split(','),
      BTlife = '0',
      BrandText = 'Unkown',
      // DeviceModel = 'Unkown',
      ChargerStatus = '离线设备',
      IsCharge = true,
      ChargeColor = tipsColor3,
      ChargePow = '',
      FormatData = Mdata;
  FormatData['ChargerStatus'] = '离线设备';
  FormatData['Brand'] = BrandText;
  FormatData['BTlife'] = BTlife;
  FormatData['Model'] = '未知型号';
  FormatData['Area'] = '未知';
  FormatData['ChargePow'] = '未知';
  FormatData['Cgr'] = '未知';
  FormatData['IsCharge'] = false;



  if (MDatas != null && MDatas.length > Mindex) {
    //厂家
    var Brandtype = MDatas[0].substring(5);
    if (Brandtype == '1') {
      BrandText = 'Movoton Inc.';
      FormatData['Brand'] = BrandText;
    } else if (Brandtype == '2') {
      BrandText = '影视飓风';
      FormatData['Brand'] = BrandText;
    } else if (Brandtype == '3') {
      BrandText = 'OEM预留';
      FormatData['Brand'] = BrandText;
    } else if (Brandtype == '4') {
      BrandText = 'OEM预留2';
      FormatData['Brand'] = BrandText;
    }

    //型号
    Map<int, String> ModelList = {1: '工程样品', 2: 'MTBK98',3:'MTBK147',4:'MT-BK9808S/RC'};

    // var Brandtype = MDatas[0].substring(5);
    for(var key in ModelList.keys){
      // print('$key : ${ModelList[key]}');
      // var Index = int.parse(MDatas[1].substring(1))+1;
      if(MDatas[1].substring(1) == '$key'){
        // print('$key : ${ModelList[key]}');
          FormatData['Model'] = '${ModelList[key]}';
      }

    }

    //地区
    Map<int, String> AreaList = {1: '中国', 2: '日本',3:'美国',4:'欧洲',5:'北美',6:'亚太'};

    // var Brandtype = MDatas[0].substring(5);
    for(var key in AreaList.keys){
      // print(MDatas[0].substring(1,2));
      // var Index = int.parse(MDatas[1].substring(1))+1;
      if(MDatas[0].substring(1,2) == '$key'){
        // print('$key : ${ModelList[key]}');
          FormatData['Area'] = '${AreaList[key]}';
      }
    }

    //充电器
    Map<int, String> CgrList = {0: '未知', 1: 'MT-2A',2:'MT-4A',3:'MT-2ch',4:'MT-4ch',5:'未知'};

    // var Brandtype = MDatas[0].substring(5);
    for(var key in CgrList.keys){
      // print(MDatas[5].substring(1));
      // var Index = int.parse(MDatas[1].substring(1))+1;
      if(MDatas[5].substring(1) == '$key'){
        // print('$key : ${ModelList[key]}');
          FormatData['Cgr'] = '${CgrList[key]}';
      }
    }


    var Chargetype = MDatas[3].substring(1);
    // print(Chargetype);
    if (Chargetype == '16') {
      ChargerStatus = '充电中';
      ChargeColor = tipsColor2;
      IsCharge = false;
      FormatData['ChargerStatus'] = '充电中';
      FormatData['IsCharge'] = true;
    } else if (Chargetype == '17') {
      ChargerStatus = '放电中';
      ChargeColor = tipsColor2;
      IsCharge = true;
      FormatData['ChargerStatus'] = '放电中';
      FormatData['IsCharge'] = false;
    } else if (Chargetype == '18') {
      IsCharge = false;
      ChargerStatus = '充放电';
      ChargeColor = tipsColor2;
      FormatData['ChargerStatus'] = '充放电';
      FormatData['IsCharge'] = true;
    } else {
      ChargerStatus = '离线设备';
      ChargeColor = tipsColor;
      IsCharge = true;
      FormatData['ChargerStatus'] = '离线设备';
      FormatData['IsCharge'] = false;
    }

    //充电功率计算
    ChargePow = (MDatas[11].substring(1) + MDatas[12].substring(1))
            .replaceAll('0', '') +
        'W';
    FormatData['ChargePow'] = ChargePow;
    if (ChargePow.replaceAll('W', '') == '') {
      FormatData['ChargePow'] = '未知';
    }

    //型号
    var Modeltype = MDatas[1].substring(1);
    // print(MDatas);
    // print(ChargePow);

    BTlife = MDatas[10];
    FormatData['BTlife'] = BTlife;
  }

  print(FormatData);

  return Card(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
    child: InkWell(
        splashColor: Colors.lightGreen[200],
        // customBorder: Border.all(),
        // focusColor: Colors.lightGreenAccent,
        // hoverColor: Colors.pink,
        // highlightColor: Color(0xFFE0E0E0),
        borderRadius: new BorderRadius.circular(20.0),
        onTap: () {
          // print(Mdata);
          _goToInfo(context, Mdata);
        },
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 13.sp)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 13)),
                Text(
                  title.toString(),
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 2.sp)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 13)),
                Text(
                  BrandText,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: tipsColor,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 7.sp)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 13)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                      decoration: BoxDecoration(
                        // boxShadow: [new BoxShadow(color: ChargeColor,blurRadius:1)],
                        border: Border.all(color: ChargeColor, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                        // color: luckyGreen,
                      ),
                      child: Row(
                        children: [
                          Offstage(
                            offstage: IsCharge,
                            child: Center(
                              child: Icon(
                                FlutterIcons.flash_mco,
                                color: luckyGreen,
                                size: 14.sp,
                              ),
                            ),
                          ),
                          Text(
                            ChargerStatus,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: ChargeColor,
                            ),
                          ),
                          Offstage(
                            offstage: IsCharge,
                            child: Center(
                              child: Text(
                                '｜',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ChargeColor,
                                ),
                              ),
                            ),
                          ),
                          Offstage(
                            offstage: IsCharge,
                            child: Center(
                              child: Text(
                                ChargePow,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ChargeColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Container(
                //     padding: EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
                //     decoration: BoxDecoration(
                //       // border: Border.all(color: luckyPink, width: 1),
                //       borderRadius: BorderRadius.all(Radius.circular(3.0)),
                //       // color: luckyGreen,
                //     ),
                //     child: Text(
                //       'V口',
                //       style: TextStyle(
                //         fontSize: 12.sp,
                //         fontWeight: FontWeight.bold,
                //         color: luckyPink,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(padding: EdgeInsets.only(left: 5)),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 0)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 13)),
                Padding(padding: EdgeInsets.only(top: 0)),
                // Image(
                //   image: AssetImage('assets/images/BatteryFull.png'),
                //   height: 45,
                //   width: 40,
                // ),
                // Text(
                //   deType.toString(),
                //   style: TextStyle(
                //     fontWeight: FontWeight.normal,
                //     fontSize: 12.sp,
                //   ),
                // ),

                // Text(
                //   deType.toString(),
                //   style: TextStyle(
                //     fontWeight: FontWeight.normal,
                //     fontSize: 12.sp,
                //   ),
                // ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 0)),
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
                      color: Colors.transparent,
                    ),
                  ),
                  Align(
                    // widthFactor: 2,
                    // heightFactor: 2,
                    alignment: Alignment.bottomLeft,
                    child: CircularPercentIndicator(
                      radius: 55.0,
                      lineWidth: 5.0,
                      percent: int.parse(BTlife) / 100,
                      center: new Text(BTlife.toString() + "%"),
                      progressColor: tipsColor2,
                      backgroundColor: Colors.grey[200],
                      backgroundWidth: 5.0,
                    ),
                  ),
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


void reSearch(val) {

}

void _goToInfo(BuildContext context, Picked) {
  Timer _timer;
  int count = 1;
  var _duration = new Duration(seconds: 0);
  new Timer(_duration, () {
    _timer = new Timer.periodic(const Duration(milliseconds: 100), (v) {
      count--;
      if (count == 0) {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => DeviceInfo(data: Picked),
            ));
      } else {
        // setState(() {});
      }
    });
    return;
  });

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

