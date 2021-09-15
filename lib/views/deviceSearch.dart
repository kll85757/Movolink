import 'package:MovoLink/utils/setting.dart';
import 'package:MovoLink/utils/ble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
// import 'package:blemulator/blemulator.dart';
import 'package:flutter_blue/flutter_blue.dart';

// typedef Logger = Function(String);

// Future<void> scanStart(Logger log, Logger errorLogger) async {
//   BleManager bleManager = BleManager();
//   await bleManager.createClient();
//   bleManager.destroyClient();

//   log("Get radio state: ${await bleManager.bluetoothState()}");
// }

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
              child: Lottie.asset('assets/lottiefiles/lego_loader.json',
                  width: 300, height: 300, repeat: false),
            ),
            Row(
              children: [
                // Lottie.asset('assets/Mobilo/Apostrophe.json',width: 50.sp),
                // Lottie.asset('assets/lottiefiles/iphone_x_loading.json',width: 50.sp),
                // Lottie.asset('assets/lottiefiles/lego_loader.json',width: 50.sp),
                // Lottie.asset('assets/lottiefiles/judgement.json',width: 50.sp),
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
            searchStart();
            // Navigator.pushNamed(context, '/deviceList');
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


@override
void initState() {
  //页面初始化
  // initBle();
}

void searchStart() {
  // startBle();
  // getBleScanNameAry();
  BleManager.instance.startScan(scanResultHandler, timeout: 10);
}
  
void scanResultHandler(List<ScanResult> results) {
  print('results ====> $results');
  for (ScanResult r in results) {
    print('${r.device.name} found! rssi: ${r.rssi}');
  }
}
