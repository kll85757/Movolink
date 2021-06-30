import 'package:flutter/material.dart';
//welcome



class welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return welcomePage();
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX;    // X方向的偏移量
  double offsetY;    // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}


Widget titleSection = Container(
  padding: const EdgeInsets.fromLTRB(20,100,20,20),
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
                  '欢迎使用',
                  maxLines: 4,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(10, 3),
                            blurRadius: 30)
                      ]),
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Expanded(
                child: Text(
                  'Movolink',
                  maxLines: 4,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(10, 3),
                            blurRadius: 30)
                      ]),
                ),
              ),
            ),
            Text(
              '使用Movolink来连接Movoton产品',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight:FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(10, 3),
                        blurRadius: 15)
                  ]
              ),
            ),
            Text(
              '在任何嘈杂的工作现场',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight:FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(10, 3),
                        blurRadius: 15)
                  ]
              ),
            ),
            Text(
              '方寸不乱，掌控一切',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight:FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(10, 3),
                        blurRadius: 15)
                  ]
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);


class welcomePage extends State<welcome> {
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
          color: Colors.white,
        ),
          child: RawMaterialButton(
          child: Text(
            '开始使用',
            style: TextStyle(color: Colors.green,fontSize: 18),
          ),
          // backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerFloat, 0, -40),
      // appBar: AppBar(title: Text('Welcome'),),
      body: new Container(
        decoration: BoxDecoration(
          image: new DecorationImage(image: new ExactAssetImage ('assets/images/welcome_bg.png'))
        ),
        child: Container(
          color:Colors.transparent,
          child: titleSection,
        ),
      ),
    );
  }
}

