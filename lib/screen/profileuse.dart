import 'dart:io';
import 'package:demo/screen/homepage.dart';
import 'package:demo/utiliti/utitls.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class useradd extends StatefulWidget {
  const useradd({super.key});

  @override
  State<useradd> createState() => _useraddState();
}

class _useraddState extends State<useradd> {
  TextEditingController fullname = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController email = TextEditingController();

  File? _image;
  final picker = ImagePicker();
  final dataref = FirebaseDatabase.instance.ref('Post');
  firebase_storage.FirebaseStorage Storage =
      firebase_storage.FirebaseStorage.instance;
  Future getimage() async {
    final PickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 90);

    setState(() {
      if (PickedFile != null) {
        _image = File(PickedFile.path);
      } else {
        print('No image pic');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(40),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.height / 6,
                      height: MediaQuery.of(context).size.height / 6,
                      child: const CircularProgressIndicator(
                        value: 0.8,
                        color: Colors.blue,
                        strokeWidth: 6,
                        strokeCap: StrokeCap.round,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          getimage();
                        },
                        child: _image != null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: FileImage(_image!.absolute),
                              )
                            : CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage('assets/images/user.png'),
                              )),
                    // Positioned(
                    //   bottom: 14,
                    //   left: 70,
                    //   child: IconButton(
                    //     onPressed: () {
                    //       getimage();
                    //     },
                    //     icon: const CircleAvatar(
                    //         backgroundColor: Color.fromARGB(255, 190, 187, 187),
                    //         radius: 15,
                    //         child: Icon(
                    //           Icons.edit,
                    //           size: 16,
                    //         )),
                    //   ),
                    // ),
                  ],
                ),
                const Gap(20),
                const Text(
                  'John Lawis',
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  'GOLD MEMBER',
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      const Text(
                        'Full Name',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextFormField(
                        textAlign: TextAlign.start,
                        controller: fullname,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Gap(20),
                      const Text(
                        'Phone Number',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextFormField(
                        textAlign: TextAlign.start,
                        controller: phoneno,
                        keyboardType: TextInputType.number,
                        keyboardAppearance: Brightness.dark,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Gap(20),
                      const Text(
                        'Email Address',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextFormField(
                        controller: email,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    firebase_storage.Reference ref = firebase_storage
                        .FirebaseStorage.instance
                        .ref('Filename' + '1234');
                    firebase_storage.UploadTask uploadimage =
                        ref.putFile(_image!.absolute);
                    Future.value(uploadimage).then((value) async {
                      var newurl = await ref.getDownloadURL();
                      final id =
                          DateTime.now().microsecondsSinceEpoch.toString();
                      dataref.child(id).set({
                        'id': id,
                        "image": newurl.toString(),
                        "Name": fullname.text.toString(),
                        "Number": phoneno.text.toString(),
                        "Address": email.text.toString(),
                      }).then((value) {
                        utitles().Toasmessg('Succesfully');
                      }).onError((error, stackTrace) {
                        utitles().Toasmessg(error.toString());
                      });
                    }).onError((error, stackTrace) {
                      utitles().Toasmessg(error.toString());
                    });

                    Get.to(() => homepage());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 14.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue),
                    child: const Center(
                        child: Text(
                      'A D D',
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
        ),
      ),
    );
  }
}
