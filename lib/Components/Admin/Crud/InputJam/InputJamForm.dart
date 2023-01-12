import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toko_jam_flutter/API/ConfigUrl.dart';
import 'package:toko_jam_flutter/Components/custom_surfix_icon.dart';
import 'package:toko_jam_flutter/Components/default_button_custome_color.dart';
import 'package:toko_jam_flutter/Screens/Admin/HomeAdminScreens.dart';
import 'package:toko_jam_flutter/Screens/Register/RegistrasiScreen.dart';
import 'package:toko_jam_flutter/Screens/User/HomeUserScreen.dart';
import 'package:toko_jam_flutter/size_config.dart';
import 'package:toko_jam_flutter/Components/Utils/constants.dart';

class FormInputJam extends StatefulWidget {
  @override 
  _FormInputJam createState() => _FormInputJam();
}

class _FormInputJam extends State<FormInputJam> {

  File? image;
  Response? response;
  var dio = Dio();

  TextEditingController txtNamaJam = TextEditingController(),
                        txtMerkJam = TextEditingController(),
                        txtHargaJam = TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildNamaJam(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMerkJam(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildHargaJam(),
          SizedBox(height: getProportionateScreenHeight(30)),
    
          image == null ? Container() 
            : Image.file(
              image!, 
              width: 250, 
              height: 250,
              fit: BoxFit.cover,
              ),
          SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButtonCustomeColor(
              color: kPrimaryColor,
              text: "Pilih Gambar Jam",
              press: () {
                pilihGambar();
              },
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButtonCustomeColor(
              color: kColorBlue,
              text: "SUBMIT",
              press: () {
                if(txtNamaJam.text == '') {
                  AwesomeDialog(
                  context: context, 
                  dialogType: DialogType.ERROR, 
                  animType: AnimType.RIGHSLIDE,
                  title: 'Peringatan',
                  desc: 'Nama Jam Tidak Boleh Kosong',
                  btnOkOnPress: () {})
                  .show();
                }else if (txtMerkJam.text == '') {
                  AwesomeDialog(
                  context: context, 
                  dialogType: DialogType.ERROR, 
                  animType: AnimType.RIGHSLIDE,
                  title: 'Peringatan',
                  desc: 'Merk Jam Tidak Boleh Kosong',
                  btnOkOnPress: () {})
                  .show();
                }else if (txtHargaJam.text == '') {
                  AwesomeDialog(
                  context: context, 
                  dialogType: DialogType.ERROR, 
                  animType: AnimType.RIGHSLIDE,
                  title: 'Peringatan',
                  desc: 'Harga Jam Tidak Boleh Kosong',
                  btnOkOnPress: () {})
                  .show();
                }else {
                  inputDataJam(txtNamaJam.text, txtMerkJam.text, txtHargaJam.text, image?.path);
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
        ],
        ),
      );
  }
TextFormField buildNamaJam() {
    return TextFormField(
      controller: txtNamaJam,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Nama Jam',
        hintText: 'Masukan Nama Jam',
        labelStyle: TextStyle(
        color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.add_chart_sharp)),

      );
  }

  TextFormField buildMerkJam() {
    return TextFormField(
      controller: txtMerkJam,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Merk Jam',
        hintText: 'Masukan Merk Jam',
        labelStyle: TextStyle(
        color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.add_chart_sharp)),

      );
  }

  TextFormField buildHargaJam() {
    return TextFormField(
      controller: txtHargaJam,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Harga Jam',
        hintText: 'Masukan Harga Jam',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.add_chart_sharp)),
        
      );
  }

  Future pilihGambar() async {
    try {
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(()=> this.image = imageTemp);
    } on PlatformException catch (e) {
      print("Gagal Mengambil Foto : $e");
    }
  }

  void inputDataJam(nama, merk, harga, gambar) async {
    utilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      var formData = FormData.fromMap({
        'nama' : nama,
        'merk' : merk,
        'harga' : harga,
        'gambar' : await MultipartFile.fromFile(gambar)
      });

      response = await dio.post(inputJam, data: formData);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if(status) {
        AwesomeDialog(
          context: context, 
          dialogType: DialogType.SUCCES, 
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: '$msg',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
            Navigator.pushNamed(context, HomeAdminScreens.routeName);
          }).show();
      }else {
        AwesomeDialog(
          context: context, 
          dialogType: DialogType.ERROR, 
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: '$msg',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          }).show();
      }
    } catch (e) {
      AwesomeDialog(
          context: context, 
          dialogType: DialogType.ERROR, 
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: 'Terjadi Kesalahan Pada Server Kami',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          }).show();
    }
  }
}
