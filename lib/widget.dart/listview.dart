import 'package:demo/model/api.dart';
import 'package:demo/model/Statservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  // Track whether each product is liked
  Map<int, bool> isLikedMap = {};
  @override
  Widget build(BuildContext context) {
    Statservice statservice = Statservice();
    return Scaffold(
      body: FutureBuilder(
        future: statservice.fetchdata(),
        builder: (context, AsyncSnapshot<Welcome> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: snapshot.data!.products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(4, 1),
                                  blurRadius: 4,
                                  color: Colors.black12,
                                )
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                  snapshot.data!.products[index].images[0],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data!.products.length,
                    itemBuilder: ((context, index) {
                      var product = snapshot.data!.products[index];
                      bool isLiked = isLikedMap.containsKey(index)
                          ? isLikedMap[index]!
                          : false;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 8),
                        child: Container(
                          width: 100,
                          height: 350,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(4, 1),
                                      blurRadius: 4,
                                      color: Colors.black12,
                                    )
                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage(product.thumbnail),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isLiked = !isLiked;
                                        isLikedMap[index] = isLiked;
                                      });
                                    },
                                    icon: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    iconSize: isLiked ? 38 : 30,
                                    color:
                                        isLiked ? Colors.red : Colors.black38,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.comment),
                                    iconSize: 36,
                                    color: Colors.black38,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.send),
                                    iconSize: 36,
                                    color: Colors.black38,
                                  ),
                                  const SizedBox(
                                    width: 190,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.save_outlined),
                                    iconSize: 36,
                                    color: Colors.black38,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${product.price} Likes',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      product.title,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '${product.category} Comments',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    Statservice statservice = Statservice();
    return Scaffold(
        body: FutureBuilder(
            future: statservice.fetchdata(),
            builder: ((context, AsyncSnapshot<Welcome> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: snapshot.data!.products.length,
                    itemBuilder: (context, index) {
                      var product = snapshot.data!.products[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        child: Container(
                            width: 90,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: BorderSide.strokeAlignCenter,
                                    offset: Offset(1, 1),
                                    blurRadius: 2.0),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 120,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(product.thumbnail))),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '₹ ' + product.price.toString(),
                                          style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(product.category.name),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 14,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 14,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 14,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 14,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 14,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      );
                    });
              }
            })));
  }
}

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  TextEditingController _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
              ),
            ),
            Card(
              child: ListTile(title: Text('UserName:')),
            ),
            Card(
              child: ListTile(title: Text('Email:')),
            ),
          ],
        ),
      ),
    );
  }
}
//  Scaffold(
//       body: Card(
//         child: Center(child: ListView.builder(itemBuilder: ((context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ExpansionTile(
//               backgroundColor: const Color.fromARGB(255, 209, 206, 206),
//               collapsedBackgroundColor: Colors.red,
//               textColor: Colors.black,
//               collapsedTextColor: Colors.white,
//               collapsedIconColor: Colors.white,
//               childrenPadding: EdgeInsets.all(10.0),
//               tilePadding: EdgeInsets.symmetric(horizontal: 9.0),
//               maintainState: true,
//               initiallyExpanded: false,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               collapsedShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//               title: Text(
//                 'user $index',
//               ),
//               children: [
//                 Text(
//                   'This function is called when the user clicks on the tile. \nWe get a Boolean isExpanded parameter in this function. ',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w600),
//                 ),
//                 Text(
//                   'metin_mouth vaggie power meets whole grains ! \nthis veggie oats Chilla is the Perfect',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w500),
//                 ),
//                 Text(
//                   'metin_mouth vaggie power meets whole grains !... ',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           );
//         }))),
//       ),
//     );