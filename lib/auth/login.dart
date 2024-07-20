import 'package:demo/auth/signup.dart';
import 'package:demo/screen/homepage.dart';
import 'package:demo/utiliti/utitls.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final _from = GlobalKey<FormState>();
  TextEditingController emails = TextEditingController();
  TextEditingController passwords = TextEditingController();
  bool issele = true;
  final auth = FirebaseAuth.instance;

  void correctaccount() {
    auth
        .signInWithEmailAndPassword(
            email: emails.text.toString(), password: passwords.text.toString())
        .then((value) {
      Get.to(homepage());
    }).onError((error, stackTrace) {
      utitles().Toasmessg(error.toString());
    });
  }

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    TextFormField(
                      controller: emails,
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
                      obscureText: issele,
                      controller: passwords,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  issele = !issele;
                                });
                              },
                              icon: issele
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          border: const OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Enter Password');
                        }
                        return null;
                      },
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    GestureDetector(
                      onTap: () {
                        if (_from.currentState!.validate()) {
                          correctaccount();
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
                          'L O G I N',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Need a account ?", style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => signup()));
                            },
                            child: Text('Sign Up',
                                style: TextStyle(color: Colors.grey.shade500)))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Stack(alignment: Alignment.center, children: [
                      Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey)),
                          child: Center(child: Text('OR'))),
       const               Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 194, 192, 192),
                      ),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(255, 83, 0, 0),
                                  width: 3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/google (2).png'))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 13,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/social (1).png'))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 14,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/linkedin.png'))),
                          ),
                        ),
                      ],
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
