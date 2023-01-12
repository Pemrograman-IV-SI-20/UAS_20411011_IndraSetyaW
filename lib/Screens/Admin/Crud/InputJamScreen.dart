import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toko_jam_flutter/Components/Admin/Crud/InputJam/InputJamComponents.dart';
import 'package:toko_jam_flutter/Components/Utils/constants.dart';

class InputJamScreens extends StatelessWidget {
  static var routeName = '/input_jam_screens';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Input Data Jam", 
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: InputJamComponent(),
    );
  }
}