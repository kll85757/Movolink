import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'handler.dart';

class Routes {
  static String root = "/";
  static String welcome = "/welcome";
  static String search = "/home";
  static String sqflitePage = "/sqflite";
  static String eventBusPage = "/eventBus";
  static String fileZipPage = "/fileZip";


  static void configureRoutes(FluroRouter router) {
    // router.notFoundHandler = Handler(
    //     handlerFunc:
    //         (BuildContext context, Map<String, List<String>> params) {});
    router.define(welcome, handler: welcomeHandler);
    router.define(search, handler: searchHandler);
    router.define(sqflitePage, handler: sqfliteHandler);

  }
}
