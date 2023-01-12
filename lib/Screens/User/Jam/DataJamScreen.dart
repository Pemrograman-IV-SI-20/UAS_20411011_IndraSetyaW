import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:toko_jam_flutter/Components/User/Jam/JamComponent.dart';
import 'package:toko_jam_flutter/size_config.dart';
import 'package:toko_jam_flutter/Components/Utils/constants.dart';

class DataJamScreens extends StatelessWidget {
  static var routeName = '/list_jam_user_screens';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
        "Daftar Jam", 
        style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        ),
        body: JamComponents(),
    );
  }
}