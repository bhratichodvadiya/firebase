import 'package:demo/screen/profileuse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class flotingaction extends StatelessWidget {
  const flotingaction({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        Get.to(()=>useradd());
      },
      child: const Icon(
        Icons.add,
        color: Colors.black,
        size: 30,
      ),
    );
  }
}
