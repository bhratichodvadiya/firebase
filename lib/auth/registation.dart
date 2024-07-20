import 'package:demo/screen/onboading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class regstration extends StatefulWidget {
  final String email;
  final String Pass;

  const regstration({super.key, required this.email, required this.Pass});

  @override
  State<regstration> createState() => _regstrationState();
}

class _regstrationState extends State<regstration> {
  final auth = FirebaseAuth.instance;
  final _from = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confitpass = TextEditingController();
  bool selectd = true;
  bool selected2 = true;

  void registaaccount() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _from,
          child: Stack(
            children: [
                Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50))),
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 4.50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    const Text(
                      'Registation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                          hintText: 'Email', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Enter email');
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    TextFormField(
                      obscureText: selectd,
                      controller: password,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  selectd = !selectd;
                                });
                              },
                              icon: selectd
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          hintText: 'Password',
                          border: const OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Enter password');
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    TextFormField(
                      obscureText: selected2,
                      controller: confitpass,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  selected2 = !selected2;
                                });
                              },
                              icon: selected2
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          hintText: 'Comfit Passwrod',
                          border: const OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Enter Confritm Password');
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    GestureDetector(
                      onTap: () {
                        if (_from.currentState!.validate()) {}
                       
                                  if (email.text.isEmpty) {
                                  Get.snackbar("Error", 'Enter the email');
                                  } else if(password.text.isEmpty){
                                    Get.snackbar("Error",'Enter your Password');
                                  } else if (confitpass.text.isEmpty){
                                    Get.snackbar("Error", 'Enter your confirm password');
                                  }else if (password.text.trim() != confitpass.text.trim()){
                        Get.snackbar("Error", 'Password not match');
                                  }else {
                        Get.to(() => onboading());
                                  }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.30,
                        height: MediaQuery.of(context).size.height / 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue),
                        child: const Center(
                            child: Text(
                          'R E G I S T E R',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
