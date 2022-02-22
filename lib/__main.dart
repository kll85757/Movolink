import 'package:flutter/material.dart';
import 'package:MovoLink/utils/setting.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          // padding:EdgeInsets.only(left: 10),
          // titleSpacing: -10.sp,
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
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String data = '离婚';
  String acceptType1 = '';
  String acceptType2 = '';
  String acceptType3 = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable<String>(
          data: data,
          feedback: Container(
            color: Colors.white,
            height: 100,
            width: 100,
            child: const Text('离婚'),
          ),
          childWhenDragging: Container(
            height: 100.0,
            width: 100.0,
            color: luckyYellow,
            child: const Center(
              child: Text('拖拽中'),
            ),
          ),
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: new Offset(3, 3),
                  blurRadius: 18,
                )
              ],
              border: null,
            ),
            child: const Center(
              child: Text('点击拖拽'),
            ),
          ),
        ),
        DragTarget<String>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              height: 100.0,
              width: 100.0,
              color: luckyGreen,
              child: Center(
                child: Text('诉讼: $acceptType1'),
              ),
            );
          },
          onAccept: (String data) {
            setState(() {
              acceptType1 = data;
              acceptType2 = '';
              acceptType3 = '';
            });
          },
        ),
        DragTarget<String>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              height: 100.0,
              width: 100.0,
              color: luckyGreen,
              child: Center(
                child: Text('诉讼: $acceptType2'),
              ),
            );
          },
          onAccept: (String data) {
            setState(() {
              acceptType2 = data;
              acceptType1 = '';
              acceptType3 = '';
            });
          },
        ),
        DragTarget<String>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              height: 100.0,
              width: 100.0,
              color: luckyGreen,
              child: Center(
                child: Text('诉讼: $acceptType3'),
              ),
            );
          },
          onAccept: (String data) {
            setState(() {
              acceptType3 = data;
              acceptType2 = '';
              acceptType1 = '';
            });
          },
        ),
      ],
    );
  }
}
