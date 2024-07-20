import 'package:demo/screen/home.dart';
import 'package:demo/screen/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class onboding {
  final String Title;
  final String subtitle;
  final String img;

  onboding({required this.Title, required this.subtitle, required this.img});
}

List<onboding> onboadingdata = [
  onboding(
      Title: 'Find Petcard Around\nYour Location',
      subtitle: 'Automation test generation tools like Webtools',
      img: 'assets/images/6965340.jpg'),
  onboding(
      Title: 'Find Petcard Around\nYour Location',
      subtitle: 'Automation test generation tools like Webtools',
      img: 'assets/images/3042607.jpg'),
  onboding(
      Title: 'Find Petcard Around\nYour Location',
      subtitle: 'Automation test generation tools like Webtools',
      img: 'assets/images/2534044.jpg'),
];

class onboading extends StatefulWidget {
  const onboading({super.key});

  @override
  State<onboading> createState() => _onboadingState();
}

class _onboadingState extends State<onboading> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  int curretindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Color.fromARGB(255, 12, 138, 241),
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        curretindex = value;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              onboadingdata[index].img,
                              height: MediaQuery.of(context).size.height / 2.3,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28),
                              child: Text(onboadingdata[index].Title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(onboadingdata[index].subtitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black38,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Spacer(),
                          ],
                        ),
                      );
                    })),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  children: [
                    Row(
                        children: List.generate(
                            3,
                            (index) => Container(
                                  margin: EdgeInsets.only(left: 5),
                                  width: curretindex == index ? 30 : 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)),
                                ))),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        curretindex != 2
                            ? _pageController.nextPage(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn)
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homepage()));
                      },
                      child: const CircleAvatar(
                        radius: 36,
                        backgroundColor: Color.fromARGB(255, 12, 138, 241),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
