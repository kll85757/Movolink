import 'package:dio/dio.dart';
//api管理


//获取用户信息
void getUserInfo() async {
  try {
    Response response = await Dio().get("http://www.google.com");
    print(response);
    return response.data;
  } catch (e) {
    print(e);
    return e;
  }
}

//把扫描出来的バーコード发给后端
void sendBarcode() async {
  try {
    Response response = await Dio().get("http://www.google.com");
    print(response);

    return response.data;
  } catch (e) {
    print(e);
    return e;
  }
}

//提交已编辑表单
void sendMsg() async {
  try {
    Response response = await Dio().get("http://www.google.com");
    print(response);
    return response.data;
  } catch (e) {
    print(e);
    return e;
  }
}

