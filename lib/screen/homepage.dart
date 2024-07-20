import 'package:demo/widget.dart/drawer.dart';
import 'package:demo/widget.dart/flotting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final auth = FirebaseAuth.instance;
  final datref = FirebaseDatabase.instance.ref('Post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Message'),),
        drawer: mydrawer(),
        floatingActionButton: const flotingaction(),
        body: FirebaseAnimatedList(
            query: datref,
            itemBuilder: (context, snapshot, animation, index) {
              return Card(
                  child: ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.child('image').value.toString()),),
                title: Text(
                  snapshot.child("Name").value.toString(),
                ),
                subtitle: Text(snapshot.child('Number').value.toString()),
              ));
            }));
  }
}
