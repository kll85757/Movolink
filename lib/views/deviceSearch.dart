import 'dart:async';

import 'package:MovoLink/utils/setting.dart';
import 'package:MovoLink/utils/ble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
// import 'package:blemulator/blemulator.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:MovoLink/views/deviceList.dart';
import 'package:MovoLink/utils/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';



// typedef Logger = Function(String);

// Future<void> scanStart(Logger log, Logger errorLogger) async {
//   BleManager bleManager = BleManager();
//   await bleManager.createClient();
//   bleManager.destroyClient();

//   log("Get radio state: ${await bleManager.bluetoothState()}");
// }
bool isSearchEnd = true;
bool animationPlay = false;
List<String> allDeviceName = [];
List allData = [];
var lastPopTime = null;


@override
void initState() {
  //页面初始化
  // super.initState();
  isSearchEnd = true;
  animationPlay = false;
}

class DevieSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    searchStart();
    return new DevieSearchPage();
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

Widget titleSection(BuildContext context) => Container(
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
              child: Container(
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
            Offstage(
              offstage: !isSearchEnd,
              child: Center(
                child: Lottie.asset('assets/Mobilo/lego_loader.json',
                    width: 300.sp, height: 300.sp, repeat: true),
              ),
            ),
            Offstage(
              offstage: isSearchEnd,
              child: Center(
                child: Lottie.asset('assets/Mobilo/done.json',
                    width: 200.sp, height: 200.sp, repeat: animationPlay,),
              ),
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
  void intervalClick(int needTime, lastPopTime) {
    // 防重复提交
    if (lastPopTime == null ||
        DateTime.now().difference(lastPopTime) > Duration(seconds: needTime)) {
      // print(lastPopTime);
      lastPopTime = DateTime.now();
      // print("允许点击");
      stopSearch(context);
    } else {
      // lastPopTime = DateTime.now(); //如果不注释这行,则强制用户一定要间隔2s后才能成功点击. 而不是以上一次点击成功的时间开始计算.
      // print("请勿重复点击！");
    }
  }

  void stopSearch(BuildContext context) {
    setState(() {
      isSearchEnd = !isSearchEnd;
      animationPlay = true;
    });
    lastPopTime = DateTime.now();
    startTime(context);
  }

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
            intervalClick(10, lastPopTime);
            // if (lastPopTime == null ||
            //     DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
            //   lastPopTime = DateTime.now();
              
            // } else {
            //   lastPopTime = DateTime.now();
            //   return;
            // }
            // stopSearch(context);
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
          child: titleSection(context),
        ),
      ),
    );
  }
}




void searchStart() {
  // startBle();
  // getBleScanNameAry();
  BleManager.instance.startScan(scanResultHandler, timeout: 10);
}

void scanResultHandler(List<ScanResult> results) {
  // print('results ====> $results');
  for (ScanResult r in results) {
    Map<String, String> deviceData;
    // print('${r.device.name} found! rssi: ${r.rssi}');
    // print('${r.device.name} found');
    // print('${r.device.name} found! rssi: ${r.advertisementData.manufacturerData}');
    // allDeviceName.add(r.device.name);
    bool isReSearch = allDeviceName.contains(r.device.name);
    if (!isReSearch) {
      if(r.device.name != ''){
        // print({r});
      }
      allDeviceName.add(r.device.name.toString());
      // allData.add(r.advertisementData.manufacturerData.toString());
      deviceData = {'name':r.device.name.toString(),'mData': r.advertisementData.manufacturerData.toString(),'loc': r.rssi.toString()};
      allData.add(deviceData);
      
    }
    if(r.device.name == ''){
      allDeviceName.remove(r.device.name);
      allData.remove(deviceData);
    }
    // bool isReSearch = allDeviceName.contains(r.device.id);
    // if(!isReSearch){
    //   allDeviceName.add(r.device.id.toString());
    // }
  }
  // print({allDeviceName});
}

void closeSearchAnime() {}

startTime(context) async {
  if(isSearchEnd){
    return null;
  }
  Timer _timer;
  int count = 3;
  var _duration = new Duration(seconds: 1);
  new Timer(_duration, () {
    // 空等1秒之后再计时
    _timer = new Timer.periodic(const Duration(milliseconds: 1000), (v) {
      count--;
      if (count == 0) {
        // Application.routes.navigateTo(context, 'DeviceList',transition: TransitionType.fadeIn);
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => DeviceList(deviceName: allDeviceName,data: allData),
            ));
      } else {
        // setState(() {});
      }
    });
    return;
  });
}
