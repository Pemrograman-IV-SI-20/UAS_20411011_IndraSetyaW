import 'package:flutter/material.dart';
import 'package:toko_jam_flutter/Screens/Admin/Crud/EditJamScreen.dart';
import 'package:toko_jam_flutter/Screens/Admin/Crud/InputJamScreen.dart';
import 'package:toko_jam_flutter/Screens/Admin/HomeAdminScreens.dart';
import 'package:toko_jam_flutter/Screens/Login/LoginScreen.dart';
import 'package:toko_jam_flutter/Screens/Register/RegistrasiScreen.dart';
import 'package:toko_jam_flutter/Screens/User/HomeUserScreen.dart';
import 'package:toko_jam_flutter/Screens/User/Jam/DataJamScreen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),

  //routes user biasa
  HomeUserScreen.routeName: (context) => HomeUserScreen(),
  DataJamScreens.routeName:(context) => DataJamScreens(),
  
  //routes admin
  HomeAdminScreens.routeName: (context) => HomeAdminScreens(),
  InputJamScreens.routeName:(context) => InputJamScreens(),
  EditJamScreens.routeName:(context) => EditJamScreens(),
};