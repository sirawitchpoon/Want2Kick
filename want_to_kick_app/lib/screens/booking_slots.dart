// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingSlot extends StatefulWidget {
  final String stadiumname;
  BookingSlot({required this.stadiumname});

  @override
  State<BookingSlot> createState() => _BookingSlotState();
}

class _BookingSlotState extends State<BookingSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Booked Slots"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("bookings")
                .where("stadiumname", isEqualTo: widget.stadiumname)
                .orderBy(
                  'time',
                )
                .snapshots(),
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
                          const SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 50.0, top: 30.0),
                            child: DataTable(
                              columns: [
                                const DataColumn(
                                    label: Text('Slot',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('${myPost["slot"]}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                              ],
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('User',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text('${myPost["email"]}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('Contact',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text('${myPost["contact"]}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('Price',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text('${myPost["price"]}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('Time',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text('${myPost["time"]}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              }
            }));
  }
}
