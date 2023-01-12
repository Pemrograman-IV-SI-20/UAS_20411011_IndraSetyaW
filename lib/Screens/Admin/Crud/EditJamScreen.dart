import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toko_jam_flutter/Components/Admin/Crud/EditJam/EditJamComponents.dart';
import 'package:toko_jam_flutter/size_config.dart';
import 'package:toko_jam_flutter/Components/Utils/constants.dart';

class EditJamScreens extends StatelessWidget {
  static var routeName = '/edit_jam_screens';
  static var dataJam;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataJam = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Edit Data Jam", 
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: EditJamComponent(),
    );
  }
}