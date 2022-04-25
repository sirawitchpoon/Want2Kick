// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'booking_slip.dart';

class BookSlotScreen extends StatefulWidget {
  final String email,
      password,
      image,
      stadiumname,
      openingtime,
      price,
      location,
      contact;
  // ignore: use_key_in_widget_constructors
  const BookSlotScreen(
      {required this.email,
      required this.password,
      required this.image,
      required this.stadiumname,
      required this.openingtime,
      required this.price,
      required this.location,
      required this.contact});

  @override
  State<BookSlotScreen> createState() => _BookSlotScreenState();
}

class _BookSlotScreenState extends State<BookSlotScreen> {
  int _groupValue = -1;

  void _showSuccessfulMessage(String msg, String time) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("From Want 2 Kick"),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingSlip(
                                  email: widget.email,
                                  password: widget.password,
                                  stadiumname: widget.stadiumname,
                                  location: widget.location,
                                  price: widget.price,
                                  slot: time,
                                  contact: widget.contact)));
                    },
                    child: const Text("Okay"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Slot",
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Image.network(
                  widget.image,
                  width: 600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'Stadium : ' + widget.stadiumname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'Select Time : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                value: 0,
                                groupValue: _groupValue,
                                title: const Text("13:00-14:00"),
                                onChanged: (newValue) => setState(
                                    () => _groupValue = newValue as int),
                                activeColor: Colors.red,
                                selected: false,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                value: 1,
                                groupValue: _groupValue,
                                title: const Text("14:00-15:00"),
                                onChanged: (newValue) => setState(
                                    () => _groupValue = newValue as int),
                                activeColor: Colors.red,
                                selected: false,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                value: 2,
                                groupValue: _groupValue,
                                title: const Text("15:00-16:00"),
                                onChanged: (newValue) => setState(
                                    () => _groupValue = newValue as int),
                                activeColor: Colors.red,
                                selected: false,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RadioListTile(
                                value: 3,
                                groupValue: _groupValue,
                                title: const Text("16:00-17:00"),
                                onChanged: (newValue) => setState(
                                    () => _groupValue = newValue as int),
                                activeColor: Colors.red,
                                selected: false,
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
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 30.0, right: 10),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: Colors.pink,
                  textColor: Colors.white,
                  onPressed: () {
                    String time = "";
                    dynamic currentTime =
                        DateFormat.jm().format(DateTime.now());
                    var message = "Your slot has been booked Successfully";
                    if (_groupValue == 0) {
                      time = "13:00-14:00";
                    } else if (_groupValue == 1) {
                      time = "14:00-15:00";
                    } else if (_groupValue == 2) {
                      time = "15:00-16:00";
                    } else {
                      time = "16:00-17:00";
                    }
                    Map<String, dynamic> data = {
                      "email": widget.email,
                      "password": widget.password,
                      "stadiumname": widget.stadiumname,
                      "location": widget.location,
                      "price": widget.price,
                      "slot": time,
                      "contact": widget.contact,
                      "time": currentTime,
                    };
                    FirebaseFirestore.instance
                        .collection("bookings")
                        .add(data)
                        .then((value) => _showSuccessfulMessage(message, time));
                  },
                  child: const Text("Book Now"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
