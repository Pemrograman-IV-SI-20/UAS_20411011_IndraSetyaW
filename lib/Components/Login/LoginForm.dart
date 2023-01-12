import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toko_jam_flutter/Components/Custom_surfix_icon.dart';
import 'package:toko_jam_flutter/Components/default_button_custome_color.dart';
import 'package:toko_jam_flutter/Screens/Admin/HomeAdminScreens.dart';
import 'package:toko_jam_flutter/Screens/Register/RegistrasiScreen.dart';
import 'package:toko_jam_flutter/API/ConfigUrl.dart';
import 'package:toko_jam_flutter/Screens/User/HomeUserScreen.dart';
import 'package:toko_jam_flutter/size_config.dart';
import 'package:toko_jam_flutter/Components/Utils/constants.dart';

class SignInform extends StatefulWidget {
  @override
  _SignInform createState() => _SignInform();
}

class _SignInform extends State<SignInform> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remeber = false;

  Response? response;
  var dio = Dio();

  TextEditingController txtUsername = TextEditingController(),
      txtPassword = TextEditingController();

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
          buiLdUserName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buiLdPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                  value: remeber,
                  onChanged: (value) {
                    setState(() {
                      remeber = value;
                    });
                  }),
              Text("Tetap Masuk"),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text("Lupa Password",
                    style: TextStyle(decoration: TextDecoration.underline)),
              )
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "MASUK",
            press: () {
              prosesLogin(txtUsername.text, txtPassword.text);
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
            child: Text(
              "Belum Punya Akun ? Daftar Disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buiLdUserName() {
    return TextFormField(
      controller: txtUsername,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Masukan Username Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/images/User.svg",
          )),
    );
  }

  TextFormField buiLdPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Masukan Password Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/images/Lock.svg",
          )),
    );
  }

  void prosesLogin(username, password) async{
    utilsApps.showDialog(context);
    bool status;
    var msg;
    var dataUserLogin;
    var dataUser;
    try{
      response = await dio.post(LoginUrl, data: {
        'username': username,
        'password': password
      });

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      dataUserLogin = response!.data['data'];
      setState(() {
        if (status) {
        utilsApps.hideDialog(context);
         AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan !!!',
            desc: 'Berhasil Login',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
              print(dataUserLogin);
              dataUser = response!.data['data'];
              if(dataUser['role']==1){
                // print("Lembar Kehalaman User Biasa");
                Navigator.pushNamed(context, HomeUserScreen.routeName);
              } else if (dataUser['role'] ==2){
                Navigator.pushNamed(context, HomeAdminScreens.routeName);
              }else  {
                print("Halaman tidak tersedia");
              }
              // Navigator.pushNamed(context, HomeUserScreens.routeName,arguments: dataUserLogin);
            },
            )..show();
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan !!!',
            desc: 'Gagal Login $msg',
            btnOkOnPress: () {},
            btnOkColor: kColorRedSlow
            )..show();
      }
      });
    } catch (e) {
      print(e);
      setState(() {
        utilsApps.hideDialog(context);
      });
      AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan !!!',
            desc: 'Terjadi Kesalahan Pada Server',
            btnOkOnPress: () {},
            )..show();
    }

    // print(response!.data['msg']);

  }
}