import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:toko_jam_flutter/Components/Admin/Crud/InputJam/InputJamForm.dart';
import 'package:toko_jam_flutter/Components/Login/LoginForm.dart';
import 'package:toko_jam_flutter/size_config.dart';
import 'package:toko_jam_flutter/Components/Utils/constants.dart';


class InputJamComponent extends StatefulWidget {
  @override
  _InputJamComponent createState() => _InputJamComponent();
}

class _InputJamComponent extends State<InputJamComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Input Data Jam !", 
                          style: mTitleStyle,
                        )
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    FormInputJam()
                ],
              ),
            ),
          ),
      ),
    );
  }

}