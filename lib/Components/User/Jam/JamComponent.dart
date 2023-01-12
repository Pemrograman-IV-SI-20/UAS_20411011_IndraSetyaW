import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:toko_jam_flutter/size_config.dart';
import 'package:toko_jam_flutter/Components/Utils/constants.dart';

import '../../../API/ConfigUrl.dart';

class JamComponents extends StatefulWidget {
  
  @override
  State<JamComponents> createState() => _JamComponents();
}

class _JamComponents extends State<JamComponents> {

  Response? response;
  var dio = Dio();
  var dataJam;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataJam();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: 
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dataJam == null ? 0 : dataJam.length,
                itemBuilder: (BuildContext context, int index){
                return cardJam(dataJam[index]);
                },
              ),
            )
            ],
          )),
          ),
      ));
  }

  Widget cardJam(data){
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          child: Container(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white))),
                    child: Image.network(
                      '$baseUrl/${data['gambar']}'),
              ),
              title: Text(
                "${data['nama']}", 
                style: 
                  TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  "${data['harga']}", 
                  style: TextStyle(
                    color: mTitleColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right, 
                color: mTitleColor, 
                size: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getDataJam() async {
    utilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      response = await dio.get(getAllJam);

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if(status) {
        setState(() {
          dataJam = response!.data['data'];
          print(dataJam);
        });
      } else {
        AwesomeDialog(
          context: context, 
          dialogType: DialogType.SUCCES, 
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: '$msg',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          }).show();
      }
    } catch (e) {
      print(e);
      AwesomeDialog(
          context: context, 
          dialogType: DialogType.ERROR, 
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: 'Terjadi Kesalahan Pada Server',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          }).show();
    }
  }
}