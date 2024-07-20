import 'dart:async';

import 'package:demo/auth/login.dart';
import 'package:demo/screen/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class authsplashservices {
  void login(){
    final auth = FirebaseAuth.instance;
    final userdata = auth.currentUser;


  if (userdata != null) {
     Timer(Duration(seconds: 3), () {
    Get.to(()=>homepage());
    });
  } else {
      Timer(Duration(seconds: 3), () {
    Get.to(()=>loginscreen());
    });
  }
  }
}