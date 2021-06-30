import 'package:flutter/material.dart';



class Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoPage();
  }
}

class InfoPage extends State<Info> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //浮动按钮
        // floatingActionButton: FloatingActionButton(
        //   child: Text('返回'),
        //   onPressed: (){
        //     Navigator.of(context).pop();
        //   },
        // ),
      // appBar: AppBar(
      //   // padding:EdgeInsets.only(left: 10),
      //   titleSpacing:-20,
      //   title: Text('返回'),
      //   backgroundColor: Color(0xFFFFFFFF),
      //   shadowColor: Colors.transparent,
      //   centerTitle:false,
      //   iconTheme: IconThemeData(
      //     color: Colors.green,
          

      //   ),
      //   actionsIconTheme: IconThemeData(
      //     color: Colors.green,
          
      //   ),
      //   textTheme: TextTheme(
      //     headline6: TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontSize: 18,
      //     color: Colors.green,
      //   )
      //   ),
      //   // titleTextStyle: TextStyle(
      //   //   color:Colors.black12
      //   // ),
      // ),
      body: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfoState();
  }
}


class InfoState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // padding:EdgeInsets.only(left: 10),
        titleSpacing: -20,
        title: Text('返回'),
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
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/infoBg2.png'),
            fit: BoxFit.cover,
          )
        )
      ),
    );
  }
}

