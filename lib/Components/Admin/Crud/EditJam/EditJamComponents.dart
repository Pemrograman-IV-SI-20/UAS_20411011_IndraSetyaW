import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:toko_jam_flutter/Components/Admin/Crud/EditJam/EditJamForm.dart';
import 'package:toko_jam_flutter/size_config.dart';
import 'package:toko_jam_flutter/Components/utils/constants.dart';


class EditJamComponent extends StatefulWidget {
  @override
  _EditJamComponent createState() => _EditJamComponent();
}

class _EditJamComponent extends State<EditJamComponent> {
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
                          "Edit Data Jam !", 
                          style: mTitleStyle,
                        )
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    FormEditJam(),
                ],
              ),
            ),
          ),
      ),
    );
  }

}