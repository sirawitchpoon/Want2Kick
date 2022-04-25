// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_string_interpolations, deprecated_member_use

import 'package:flutter/material.dart';

import 'home_screen.dart';

class BookingSlip extends StatefulWidget {
  final String email, password, stadiumname, location, price, slot, contact;
  BookingSlip(
      {required this.email,
      required this.password,
      required this.stadiumname,
      required this.location,
      required this.price,
      required this.slot,
      required this.contact});

  @override
  State<BookingSlip> createState() => _BookingSlipState();
}

class _BookingSlipState extends State<BookingSlip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Booking slip"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ListView(children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          DataTable(
            columns: [
              const DataColumn(
                  label: Text('Email',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('${widget.email}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text('Stadium Name',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                DataCell(Text('${widget.stadiumname}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold))),
              ]),
              DataRow(cells: [
                const DataCell(Text('Location',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                DataCell(Text('${widget.location}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold))),
              ]),
              DataRow(cells: [
                const DataCell(Text('price',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                DataCell(Text('${widget.price}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold))),
              ]),
              DataRow(cells: [
                const DataCell(Text('slot',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                DataCell(Text('${widget.slot}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold))),
              ]),
              DataRow(cells: [
                const DataCell(Text('contact',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                DataCell(Text('${widget.contact}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold))),
              ]),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 30.0, right: 10),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.pink,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                email: widget.email,
                                password: widget.password,
                              )));
                },
                child: const Text("Return To Home"),
              ),
            ),
          )
        ]));
  }
}
