import 'package:flutter/material.dart';
import 'package:practice_login/pages/dashboard_page.dart';
import 'package:practice_login/pages/login_page.dart';

class Routes {
  static const String Dasboard = "/dashboard";
  static const String Login = "/Login";
 static Map<String, WidgetBuilder> getRoutes() {
    return {
      "/Login": (context) => LoginPage(),
      "/dashboard": (context) => DashboardPage(),
    };
  }
}
