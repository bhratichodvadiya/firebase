import 'package:demo/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mydrawer extends StatelessWidget {
 mydrawer({super.key});

final auth = FirebaseAuth.instance;


void logout (){
auth.signOut();
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>[
              const ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Colors.black,
                ),
                title: Text('location'),
              ),
              const ListTile(
                leading: Icon(
                  Icons.photo_album_outlined,
                  color: Colors.black,
                ),
                title: Text('albume'),
              ),
              const ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Text('settings'),
              ),
              const ListTile(
                leading: Icon(
                  Icons.offline_pin_rounded,
                  color: Colors.black,
                ),
                title: Text('offine'),
              ),
              const ListTile(
                leading: Icon(
                  Icons.upload,
                  color: Colors.black,
                ),
                title: Text('upload'),
              ),
              InkWell(
                onTap: (){
                  logout();
                  Get.to(()=>signup());
                },
                child:const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text('Log out'),
                ),
              )
            ],
          ),
        );
  }
}