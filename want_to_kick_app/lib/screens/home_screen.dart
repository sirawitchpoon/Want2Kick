// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'booking_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  final String password;
  HomeScreen({required this.email, required this.password});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'User: ' + widget.email,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                icon: const Icon(Icons.logout_outlined))
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("stadiums").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot myPost =
                          (snapshot.data! as QuerySnapshot).docs[index];
                      return Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0.0, bottom: 8.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    shadowColor: const Color(0x802196F3),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: GestureDetector(
                                                onTap: () {
                                                  var image = myPost['image'];
                                                  var stadiumname =
                                                      myPost['stadiumname'];
                                                  var openingtime =
                                                      myPost['openingtime'];
                                                  var price = myPost['price'];
                                                  var location =
                                                      myPost['location'];
                                                  var contact =
                                                      myPost['contact'];
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => BookingScreen(
                                                              email:
                                                                  widget.email,
                                                              password: widget
                                                                  .password,
                                                              image: image,
                                                              stadiumname:
                                                                  stadiumname,
                                                              openingtime:
                                                                  openingtime,
                                                              price: price,
                                                              location:
                                                                  location,
                                                              contact: contact,
                                                              stadiumperiod1:
                                                                  myPost[
                                                                      'stadiumperiod1'],
                                                              stadiumperiod2:
                                                                  myPost[
                                                                      'stadiumperiod2'],
                                                              stadiumperiod3:
                                                                  myPost[
                                                                      'stadiumperiod3'],
                                                              stadiumperiod4:
                                                                  myPost[
                                                                      'stadiumperiod4'])));
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                    '${myPost['image']}',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              '${myPost['stadiumname']}',
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.justify,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              '${myPost['price']} Baht/Hour',
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              }
            }));
  }
}
