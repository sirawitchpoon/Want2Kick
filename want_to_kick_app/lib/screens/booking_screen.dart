// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'booking_slots.dart';
import 'bookslot_screen.dart';

class BookingScreen extends StatefulWidget {
  final String email,
      password,
      image,
      stadiumname,
      openingtime,
      price,
      location,
      contact;
  // ignore: use_key_in_widget_constructors
  const BookingScreen(
      {required this.email,
      required this.password,
      required this.image,
      required this.stadiumname,
      required this.openingtime,
      required this.price,
      required this.location,
      required this.contact});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Screen"),
        backgroundColor: Colors.black,
        centerTitle: true,
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
              height: 30,
            ),
            // ignore: avoid_unnecessary_containers
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0),
              child: Text(
                widget.location,
                style: const TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'Price : ' + widget.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'Opening Time : ' + widget.openingtime,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 13.0),
              child: Text(
                'Contact : ' + widget.contact,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 17.0, right: 10),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookingSlot(stadiumname: widget.stadiumname)));
                  },
                  child: const Text("View Slot"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 17.0, right: 10),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: Colors.pink,
                  textColor: Colors.white,
                  onPressed: () {
                    var email = widget.email;
                    var password = widget.password;
                    var image = widget.image;
                    var stadiumname = widget.stadiumname;
                    var openingtime = widget.openingtime;
                    var price = widget.price;
                    var location = widget.location;
                    var contact = widget.contact;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookSlotScreen(
                                  email: email,
                                  password: password,
                                  image: image,
                                  stadiumname: stadiumname,
                                  openingtime: openingtime,
                                  price: price,
                                  location: location,
                                  contact: contact,
                                )));
                  },
                  child: const Text("Book Slot"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
