import 'package:flutter/material.dart';
import 'package:MovoLink/utils/setting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui show Image;

class DeviceInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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
      ..color = luckyGreen
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
  bool shouldRepaint(MyPainter oldDelegate) => true;
  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => true;
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
          color: Colors.green,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.green,
        ),
        textTheme: TextTheme(
            headline6: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.green,
        )),
        // titleTextStyle: TextStyle(
        //   color:Colors.black12
        // ),
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
                                              'V-Mount Battery 98',
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
                                                  'Movoton Inc.',
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
                                          color: luckyGreen,
                                        ),
                                        child: Text(
                                          'MTBK98',
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
                                      Border.all(color: luckyGreen, width: 0.8),
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
                                                  '76',
                                                  style: TextStyle(
                                                      fontSize: 70.sp,
                                                      color: luckyGreen),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '%',
                                                      style: TextStyle(
                                                          fontSize: 35.sp,
                                                          color: luckyGreen),
                                                    ),
                                                    Text(
                                                      '放电中',
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: tipsColor),
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
                                              height: 40.sp,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    offset: new Offset(3, 3),
                                                    blurRadius: 18,
                                                  )
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
                                                    '产地',
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
                                                                    5.0)),
                                                        // color: luckyGreen,
                                                      ),
                                                      child: Text(
                                                        '中国',
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: luckyGreen,
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
                                                Icon(
                                                  FlutterIcons.smile_o_faw,
                                                  color: luckyGreen,
                                                  size: 60.sp,
                                                ),
                                                Column(
                                                  children: [
                                                    // Padding(padding: EdgeInsets.only(right:50)),
                                                    Text(
                                                      '工作正常',
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: luckyGreen),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          // FlutterIcons.wi_lightning_wea,
                                                          FlutterIcons
                                                              .flash_mco,
                                                          color: luckyGreen,
                                                          size: 27.sp,
                                                        ),
                                                        Text(
                                                          '25W',
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  luckyGreen),
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
                                          Row(
                                            children: [
                                              Image(
                                                image: AssetImage(
                                                    'assets/images/gps.png'),
                                                height: 18,
                                                width: 18,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5)),
                                              Text(
                                                '距离你约23米',
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
                                ],
                              ),
                            )),
                      )),
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
                                border: Border.all(color: luckyGreen),
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
                                          color: luckyGreen,
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
                                  left:51.sp,
                                  top:53.sp,
                                  // alignment:
                                  child: Lottie.asset(
                                    'assets/Mobilo/GPSS.json',
                                    width: 50.sp,
                                    height: 50.sp,
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
                                Positioned(
                                  child: Lottie.asset(
                                    'assets/Mobilo/gps.json',
                                    width: 12.sp,
                                    height: 12.sp,
                                  ),
                                ),
                              ],
                            ))),
                  )
                ]),
                Row(
                  children: [],
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
