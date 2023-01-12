import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:toko_jam_flutter/Components/Admin/Crud/HomeAdminComponents.dart';
import 'package:toko_jam_flutter/Screens/Admin/Crud/InputJamScreen.dart';
import 'package:toko_jam_flutter/Screens/Login/LoginScreen.dart';
import 'package:toko_jam_flutter/size_config.dart';
import 'package:toko_jam_flutter/Components/Utils/constants.dart';


class HomeAdminScreens extends StatelessWidget {
  static var routeName = '/home_admin_screens';
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Toko Jam", 
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.home,
        color: mTitleColor,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InputJamScreens.routeName);
            },
            child: Row(children: const [
              Icon(Icons.add,color: mTitleColor),
              Text(
                "Input Data", 
                style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
                )
              ]),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: HomeAdminComponent(),
      floatingActionButton: FloatingActionButton(
        onPressed:  () {
          AwesomeDialog(
                  context: context, 
                  dialogType: DialogType.INFO, 
                  animType: AnimType.RIGHSLIDE,
                  title: 'Peringatan',
                  desc: 'Yakin Ingin Keluar Dari Aplikasi ?',
                  btnCancelOnPress: () {},
                  btnCancelText: 'Tidak',
                  btnOkText: 'Yakin',
                  btnOkOnPress: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  })
                  .show();
        },
        backgroundColor: kColorRedSlow,
        child: Icon(Icons.logout, 
        color: Colors.white,
        ),
      ),
    );
  }
}
