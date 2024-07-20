import 'package:animated_background/animated_background.dart';
import 'package:demo/services/authservice.dart';
import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});
  @override
  State<splashscreen> createState() => _splashscreenState();
}
class _splashscreenState extends State<splashscreen>
    with SingleTickerProviderStateMixin {
  Color Colors1 = const Color.fromARGB(255, 47, 13, 637);
  Color Colors2 = const Color.fromARGB(255, 98, 88, 102).withAlpha(1);
authsplashservices authserviecs = authsplashservices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   authsplashservices().login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors1,
      body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
            baseColor: Colors2,
            spawnMaxRadius: 40,
            spawnMinRadius: 20,
            spawnOpacity: 0.1,
            minOpacity: 0.2,
            maxOpacity: 0.4,
            spawnMaxSpeed: 80,
            spawnMinSpeed: 20,
          )),
          child: const Center(
              child: Text(
            'I N S T A G R A M',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white70),
          ))),
    );
  }
}
