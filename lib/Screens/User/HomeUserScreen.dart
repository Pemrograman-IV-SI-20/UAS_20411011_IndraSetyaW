import 'package:flutter/material.dart';
import 'package:toko_jam_flutter/size_config.dart';

class HomeUserScreen extends StatelessWidget {
  static String routeName = "/home_user";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(child: Text("Selamat Datang Di Aplikasi Keren")),
    );
  }
}