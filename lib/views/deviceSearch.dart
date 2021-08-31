import 'package:MovoLink/utils/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';


//welcome

class DevieSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DevieSearchPage();
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX; // X方向的偏移量
  double offsetY; // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}

Widget titleSection = Container(
  padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
  color: Colors.transparent,
  child: Row(
    children: [
      Expanded(
        //分析1
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //分析 2
          children: [
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Expanded(
                child: Text(
                  '搜索设备',
                  maxLines: 4,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                      color: luckyGreen,
                      ),
                ),
              ),
            ),
            Text(
              '请确保手机的蓝牙功能处于开启状态',
              style: TextStyle(
                  color: tipsColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  ),
            ),
            Padding(padding: EdgeInsets.only(top: 130.sp)),
            Center(
              child: Lottie.asset(
                'assets/Mobilo/M.json',
                width: 200,
                height: 255,
                // repeat: false
              ),
            ),
            Row(
              children: [
                
                // Lottie.asset(
                //   'assets/Mobilo/O.json',
                //   width: 50,
                //   height: 55,
                // ),
                // Lottie.asset(
                //   'assets/Mobilo/V.json',
                //   width: 50,
                //   height: 55,
                // ),
                // Lottie.asset(
                //   'assets/Mobilo/O.json',
                //   width: 50,
                //   height: 55,
                // ),
                // Lottie.asset(
                //   'assets/Mobilo/L.json',
                //   width: 50,
                //   height: 55,
                // ),
                // Lottie.asset(
                //   'assets/Mobilo/I.json',
                //   width: 50,
                //   height: 55,
                // ),
                // Lottie.asset(
                //   'assets/Mobilo/N.json',
                //   width: 50,
                //   height: 55,
                // ),
                // Lottie.asset(
                //   'assets/Mobilo/K.json',
                //   width: 50,
                //   height: 55,
                // ),
              ],
            )
            
            
          ],
        ),
      ),
    ],
  ),
);

class DevieSearchPage extends State<DevieSearch> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //浮动按钮
      floatingActionButton: Container(
        height: 45,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: luckyGreen,
        ),
        child: RawMaterialButton(
          child: Text(
            '开始',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/deviceList');
          },
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerFloat, 0, -40),
      // appBar: AppBar(title: Text('Welcome'),),
      body: new Container(
        decoration: BoxDecoration(
            // image: new DecorationImage(
            //   image: new ExactAssetImage('assets/images/welcome_bg.png'),
            // )
        ),
        child: Container(
          color: Colors.transparent,
          child: titleSection,
        ),
      ),
    );
  }
}
