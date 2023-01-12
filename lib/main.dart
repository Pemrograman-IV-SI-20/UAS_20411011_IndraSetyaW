
import 'package:flutter/material.dart';
import 'package:toko_jam_flutter/Screens/Login/LoginScreen.dart';
import 'package:toko_jam_flutter/routes.dart';
import 'package:toko_jam_flutter/theme.dart';

void main() async {
  runApp(
    MaterialApp(
      title: "Toko Jam",
      theme: theme(),
      initialRoute: LoginScreen.routeName,
      routes: routes,
    )
  );
}