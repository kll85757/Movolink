import 'package:flutter/material.dart';
import 'package:MovoLink/utils/setting.dart';
import 'package:MovoLink/utils/dragItem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui show Image;
import 'dart:math' as math;

Map InfoData;
var isDeviceUnkown = false;
var activeColor = tipsColor2;


// Map TestData = {6: [1, 9, 33, 10, 141, 115, 133, 185, 22, 32, 68, 69, 83, 75, 84, 79, 80, 45, 72, 84, 50, 53, 86, 79, 52]} ;
class DeviceInfo extends StatefulWidget {
  Map data;
  DeviceInfo({this.data});

  @override
  State<StatefulWidget> createState() {
    InfoData = data;
    print(InfoData);
    if(InfoData['Model']=='未知型号'){
      isDeviceUnkown = true;
      activeColor = tipsColor;
    }else{
      activeColor = tipsColor2;
      isDeviceUnkown = false;
    }
    return InfoPage();
  }
}

// ignore: must_be_immutable
class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final width = 300;
    // final height = 300;
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Center(
      child: CustomPaint(
        size: Size(300, 300), //指定画布大小
        painter: MyPainter(),
      ),
    );
  }
}

class DraggingBg extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 120.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 20, 15),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              border: Border.all(color: activeColor, width: 0.8),
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: new Offset(3, 3),
                  blurRadius: 18,
                )
              ],
            ),
          )
      )
    ); 
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double eWidth = size.width / 12;
    final double eHeight = size.height / 12;
    //網格背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = Color(0xffFFFFFF)
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter
      ..strokeMiterLimit = 20
      ..blendMode = BlendMode.srcIn;
    canvas.drawRect(Offset.zero & size, paint);

    //網格風格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = activeColor
      ..strokeWidth = 0.3;

    for (int i = 0; i <= 25; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 25; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}

class InfoPage extends State<DeviceInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoState();
  }
}

class InfoState extends State<HomePage> {
  void initState() {
    // super.doReload();
    // ignore: unused_element
    super.initState();
    print(InfoData);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // padding:EdgeInsets.only(left: 10),
        titleSpacing: -10.sp,
        // title: Text('Back'),
        backgroundColor: Color(0xFFFFFFFF),
        shadowColor: Colors.transparent,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: luckyGreen,
        ),
        actionsIconTheme: IconThemeData(
          color: luckyGreen,
        ),
        textTheme: TextTheme(
            headline6: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: luckyGreen,
        )),
      ),
      body: new Container(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 100.0 //最小高度为50像素
                            ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 14, 20, 15),
                          width: MediaQuery.of(context).size.width,
                          height: 130,
                          child: Container(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              height: 50.0,
                              width: 100.0,
                              child: new Container(
                                width: 100,
                                alignment: Alignment(10, 10),
                                padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              InfoData['name'],
                                              style: TextStyle(fontSize: 16.sp),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5)),
                                            Row(
                                              children: [
                                                Image(
                                                  image: AssetImage(
                                                      'assets/images/tips.png'),
                                                  height: 18,
                                                  width: 18,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 8)),
                                                Text(
                                                  InfoData['Brand'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: tipsColor,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Flexible(
                                      flex: 10,
                                      fit: FlexFit.loose,
                                      child: Container(
                                        margin: EdgeInsets.all(5.0),
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    Align(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0)),
                                          color: activeColor,
                                        ),
                                        child: Text(
                                          InfoData['Model'],
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )),
                  ],
                ),
                Row(
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 120.0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 10, 15),
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          child: Container(
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      // color: luckyGreen,
                                      // color: Color(0xFFF0F0F0),
                                      // offset: new Offset(3, 3),
                                      blurRadius: 0,
                                    )
                                  ],
                                  // border: Border.all(color: Color(0xFFF0F0F0),width: 2),
                                  border:
                                      Border.all(color: activeColor, width: 0.8),
                                  // border: Border.all(color: Colors.white,width: 2),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25.0),
                                    topLeft: Radius.circular(25.0),
                                    bottomLeft: Radius.circular(25.0),
                                    bottomRight: Radius.circular(25.0),
                                  )),
                              height: 50.0,
                              width: 100.0,
                              child: new Container(
                                width: 100,
                                alignment: Alignment(10, 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  InfoData['BTlife'],
                                                  style: TextStyle(
                                                      fontSize: 70.sp,
                                                      color: activeColor),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '%',
                                                      style: TextStyle(
                                                          fontSize: 35.sp,
                                                          color: activeColor),
                                                    ),
                                                    Text(
                                                      InfoData['ChargerStatus'],
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: activeColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 0, 15, 0),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              height: 35.sp,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                // border:Border(top:BorderSide(color:luckyGreen,width:1)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey[200],
                                                    offset:Offset(2, 2),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                        'assets/images/earth.png'),
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 5)),
                                                  Text(
                                                    '区域',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: tipsColor,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 10,
                                                    fit: FlexFit.loose,
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.all(5.0),
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  Align(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 2, 5, 2),
                                                      decoration: BoxDecoration(

                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0)),
                                                        // color: luckyGreen,
                                                      ),
                                                      child: Text(
                                                        InfoData['Area'],
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: activeColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        )),
                    ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 120.0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 20, 15),
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          child: Container(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              height: 50.0,
                              width: 100.0,
                              child: new Container(
                                width: 100,
                                alignment: Alignment(10, 10),
                                padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [

                                                Offstage(
                                                  offstage: isDeviceUnkown,
                                                  child: Center(
                                                    child: Icon(
                                                      FlutterIcons.smile_o_faw,
                                                      color: activeColor,
                                                      size: 60.sp,
                                                    ),
                                                  ),
                                                ),
                                                Offstage(
                                                  offstage: !isDeviceUnkown,
                                                  child: Center(
                                                    child: Icon(
                                                      FlutterIcons.meh_o_faw,
                                                      color: activeColor,
                                                      size: 60.sp,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    // Padding(padding: EdgeInsets.only(right:50)),
                                                    Offstage(
                                                      offstage: isDeviceUnkown,
                                                      child: Text(
                                                        '工作正常',
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: activeColor),
                                                      )
                                                    ),
                                                    Offstage(
                                                      offstage: !isDeviceUnkown,
                                                      child: Text(
                                                        '状态未知',
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: activeColor),
                                                      )
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          // FlutterIcons.wi_lightning_wea,
                                                          FlutterIcons
                                                              .flash_mco,
                                                          color: activeColor,
                                                          size: 27.sp,
                                                        ),
                                                        Text(
                                                          InfoData['ChargePow'],
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                              activeColor),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Flexible(
                                              flex: 10,
                                              fit: FlexFit.loose,
                                              child: Container(
                                                margin: EdgeInsets.all(5.0),
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                // Image(
                                                //   image: AssetImage(
                                                //       'assets/images/tips.png'),
                                                //   height: 18,
                                                //   width: 18,
                                                // ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 6)),
                                                Offstage(
                                                  offstage: InfoData['IsCharge'],
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        // FlutterIcons.wi_lightning_wea,
                                                        FlutterIcons
                                                            .battery_charging_wireless_outline_mco,
                                                        color: tipsColor,
                                                        size: 20.sp,
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 8)),
                                                      Text(
                                                        '未连接电源',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: tipsColor,
                                                        ),
                                                      ),
                                                    ]
                                                  ),
                                                ),
                                                Offstage(
                                                  offstage: !InfoData['IsCharge'],
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        // FlutterIcons.wi_lightning_wea,
                                                        FlutterIcons
                                                            .battery_charging_wireless_outline_mco,
                                                        color: luckyGreen,
                                                        size: 20.sp,
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.only(
                                                              left: 8)),
                                                      Text(
                                                        '充电器 '+InfoData['Cgr'],
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          color: luckyGreen,
                                                        ),
                                                      ),
                                                    ]
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        )),
                  ],
                ),
                Row(children: [
                  
                      ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 120.0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 10, 20),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2,
                            child: Container(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0))),
                                height: 50.0,
                                width: 100.0,
                                child: new Container(
                                  width: 100,
                                  alignment: Alignment(10, 10),
                                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '位置',
                                                style: TextStyle(fontSize: 16.sp),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(top: 5)),

                                              Offstage(
                                                offstage: isDeviceUnkown,
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      // FlutterIcons.wi_lightning_wea,
                                                      FlutterIcons
                                                          .location_on_mdi,
                                                      color: activeColor,
                                                      size: 20.sp,
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets.only(
                                                            right: 5)),
                                                    Text(
                                                      '距离你约' +
                                                          rssiRange(int.parse(
                                                              InfoData['loc']))
                                                              .toString() +
                                                          '米',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: tipsColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),Offstage(
                                                offstage: !isDeviceUnkown,
                                                child: Row(
                                                  children: [

                                                    Text(
                                                      '未知',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: tipsColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        ), 
                  
                    
                  
                  // Positioned(
                  //   child: Lottie.asset(
                  //     'assets/Mobilo/gps.json',
                  //     width: 30,
                  //     height: 30,
                  //   ),
                  // ),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 120.0),
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 20, 20),
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: new Offset(3, 3),
                                    blurRadius: 10,
                                  )
                                ],
                                border: Border.all(color: activeColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(255.0))),
                            height: 50.0,
                            width: 100.0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      // image: ,
                                      boxShadow: [
                                        BoxShadow(
                                          color: activeColor,
                                          // color: Colors.grey.withOpacity(0.2),
                                          // blurRadius: 20.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 1,
                                          blurRadius: 15.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(255.0))),
                                  alignment: Alignment(10, 10),
                                  // padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  child: PhysicalModel(
                                    color: Colors.transparent,
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(288),
                                    child: Container(
                                      // clipBehavior: Clip.antiAlias,
                                      // child:CustomPaintRoute(),
                                      child: CustomPaint(
                                        size: Size(300, 300),
                                        isComplex: true,
                                        willChange: true,
                                        painter: MyPainter(),
                                      ),
                                    ),
                                  ),
                                ),


                                Positioned(
                                  left: 51.sp,
                                  top: 53.sp,
                                  // alignment:
                                  child: Offstage(
                                    offstage: isDeviceUnkown,
                                    child: Center(
                                      child: Lottie.asset(
                                        'assets/Mobilo/GPSL.json',
                                        width: 50.sp,
                                        height: 50.sp,
                                      ),
                                    ),
                                  ),
                                  // child: Lottie.asset(
                                  //   'assets/lottiefiles/turbine.json',
                                  //   width: 1000.sp,
                                  //   height: 1000.sp,
                                  // ),
                                  // child: Lottie.asset(
                                  //   'assets/Mobilo/gps.json',
                                  //   width: 16.sp,
                                  //   height: 16.sp,
                                  // ),
                                ),
                                // Positioned(
                                //   child: Lottie.asset(
                                //     'assets/Mobilo/gps.json',
                                //     width: 12.sp,
                                //     height: 12.sp,
                                //   ),
                                // ),
                              ],
                            ))),
                  )
                ]),
                Row(
                  children: [
                    // Draggable(child: Text('11'), feedback: Text('122'))
                  ],
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              image: new DecorationImage(
                image: new ExactAssetImage('assets/images/infoBg2.png'),
                fit: BoxFit.cover,
              ))),
    );
  }
}

num rssiRange(rssi) {
  var A = 59.0;
  var N = 2.0;
  var ReRssi = rssi.abs();
  var power = ((ReRssi - A) / (10 * N).truncate());
  var res = math.pow(10, power).truncate();
  return res;
}
