import 'package:demo/auth/login.dart';
import 'package:demo/auth/registation.dart';
import 'package:demo/utiliti/utitls.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final auth = FirebaseAuth.instance;
  TextEditingController emaild = TextEditingController();
  TextEditingController passwordd = TextEditingController();
  bool isselected = true;
  final _form = GlobalKey<FormState>();
  void loginaccount() {
    auth
        .createUserWithEmailAndPassword(
            email: emaild.text.toString(), password: passwordd.text.toString())
        .then((value) {})
        .onError((error, stackTrace) {
      utitles().Toasmessg(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _form,
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
                      'Sign up',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    TextFormField(
                      controller: emaild,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          print('Enter passwprd');
                        }
                        return null;
                      },
                      obscureText: isselected,
                      controller: passwordd,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isselected = !isselected;
                                });
                              },
                              icon: isselected
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          border: const OutlineInputBorder()),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    GestureDetector(
                      onTap: () {
                        if (_form.currentState!.validate()) {
                          loginaccount();
                          Get.to(regstration(
                              email: emaild.text.toString(),
                              Pass: passwordd.text.toString()));
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
                          'S I G N U P',
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
                        const Text(
                          "Already a user ?",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => loginscreen()));
                            },
                            child: Text(
                              'login Up',
                              style: TextStyle(color: Colors.grey.shade500),
                            )),
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
                      const Divider(
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
                    )
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

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(0, size.height * 0.75);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
