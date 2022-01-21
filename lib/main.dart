import 'dart:async';

import 'package:flutter/material.dart';
import 'package:MovoLink/views/StockManager.dart';
import 'package:MovoLink/views/welcome.dart';
import 'package:MovoLink/views/deviceInfo.dart';
import 'package:MovoLink/views/deviceList.dart';
import 'package:MovoLink/views/deviceSearch.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:fluro/fluro.dart';
import 'utils/application.dart';
import 'utils/routers.dart';

// import 'package:MovoLink/wave.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new FluroRouter();
    Routes.configureRoutes(router);
    Application.routes = router;
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF75a137),
          fontFamily: 'Ubuntu',
          textTheme: TextTheme(
            //To support the following, you need to use the first initialization method
            button: TextStyle(fontSize: 18.sp),
          ),
        ),
        initialRoute: 'main', //配置默认访问路径
        home: HomePage(),
        routes: {
          //需要使用context指定上下文
          // '/wave': (context) => WithBuilder(), //
          '/main': (context) => HomePage(), //
          '/welcome': (context) => welcome(), //
          '/deviceInfo': (context) => DeviceInfo(), //
          '/deviceList': (context) => DeviceList(), //
          '/deviceSearch': (context) => DevieSearch(), //
        },
      ),
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

final userType = 'newUser';
void _toNext(BuildContext context, userFlag) {
  if (userFlag == 'newUser') {
    // Navigator.pushNamed(context, '/welcome');
    Application.routes.navigateTo(context, 'welcome', transition: TransitionType.fadeIn);
    // FluroRouter()
    //     .navigateTo(context, "welcome", transition: TransitionType.fadeIn);
  }
}

class ListState extends State<HomePage> {
  Timer _timer;
  int count = 3;
  startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: 1);
    new Timer(_duration, () {
      // 空等1秒之后再计时
      _timer = new Timer.periodic(const Duration(milliseconds: 1000), (v) {
        count--;
        if (count == 0) {
          // Navigator.pushNamed(context, '/welcome');

          _toNext(context, userType);
        } else {
          setState(() {});
        }
      });
      return;
    });
  }

  @override
  void initState() {
    //页面初始化
    super.initState();
    startTime();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(title: Text('Movolink页面列表'),),
      // body: GridView.count(
      //     padding: EdgeInsets.all(5.0),
      //     //一行多少个
      //     crossAxisCount: 2,
      //     //滚动方向
      //     scrollDirection: Axis.vertical,
      //     // 左右间隔
      //     crossAxisSpacing: 5.0,
      //     // 上下间隔
      //     mainAxisSpacing: 5.0,
      //     //宽高比
      //     childAspectRatio: 2 / 2,
      //     //设置itemView
      //     children: initListWidget(context,MenuNun),
      // )
      body: Center(
          child: Lottie.asset(
            'assets/Mobilo/M.json',
            // alignment: Alignment(0,14),
            width: 200.sp,
            height: 300.sp,
            // repeat: false
          ),
      ),
    );
  }
}

List<String> MenuNun = ['1', 'Welcome', '设备检索', '设备列表'];

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
                  offset: new Offset(5.0, 5.0),
                  blurRadius: 10.0,
                )
              ],
              border: null,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
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
    child: InkWell(
        splashColor: Colors.pinkAccent.withAlpha(50),
        onTap: () {
          _goToPage(context, title);
        },
        child: new Center(
//            child: new Text(title.toString()
          child: Text(
            title.toString(),
            style: TextStyle(
//                fontWeight: FontWeight.normal,
//                fontSize: 18,
                ),
          ),
        )),
  );
}

void _goToPage(BuildContext context, title) {
  if (title == '1') {
    Navigator.pushNamed(context, '/wave');
  } else if (title == 'Welcome') {
    Navigator.pushNamed(context, '/welcome');
  } else if (title == '设备检索') {
    Navigator.pushNamed(context, '/deviceSearch');
  } else if (title == '设备列表') {
    Navigator.pushNamed(context, '/deviceList');
  }
  print({new DateTime.now()});
  return;
}
