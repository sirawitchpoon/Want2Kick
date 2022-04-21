// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:want_2_kick/cells/detail_ceil.dart';
import 'package:want_2_kick/models/stadium.dart';
import 'package:want_2_kick/utils/custom_icons_icons.dart';
import 'package:want_2_kick/utils/he_color.dart';

class DetailPage extends StatefulWidget {
  final Stadium stadium;

  const DetailPage({Key? key, required this.stadium}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

/// **************************************
/// ACTIONS
/// **************************************

class _DetailPageState extends State<DetailPage> {
  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleSection(),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stadium: ' + widget.stadium.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Row(
                    children: [
                      Icon(
                        CustomIcons.pin_location,
                        size: 14,
                        color: HexColor('#C6C6CD'),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.stadium.location,
                        style: TextStyle(
                          color: HexColor('#C6C6CD'),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  //Location
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    '"Anfield" the stadium for the all time greatest Footclub in history, "Emirates" the stadium for and old man "Arsenal", "Ethihad" the stadium for the team which has no UCL trophy, "Campnou" the stadium for an alien',
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 91,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DetailCell(title: '300k', subTitle: 'People'),
                        DetailCell(
                            title: widget.stadium.capacity,
                            subTitle: 'Capacity'),
                        DetailCell(
                            title: widget.stadium.opened, subTitle: 'opened'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Select Time: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.greenAccent[700],
                            child: const Text(
                              "8:00-9:00",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.greenAccent[700],
                            child: const Text(
                              "9:00-10",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.greenAccent[700],
                            child: const Text(
                              "10:00-11:00",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Booking Time

                  // GestureDetector(onTap: null,
                  //  child: Padding(
                  //    padding: const EdgeInsets.all(8),
                  //    child: Align(
                  //      alignment: Alignment.centerRight,
                  //      child: Icon(Icons.calendar_today,color: Colors.white,),
                  //    ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// APP BAR
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: Icon(CustomIcons.arrow_left, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Container _titleSection() {
    return Container(
      height: 250,
      color: Colors.grey[850],
      child: Stack(
        children: [
          Positioned(
            right: 104,
            bottom: 15,
            child: SizedBox(
              height: 250,
              child: AspectRatio(
                aspectRatio: 196 / 285,
                child: Hero(
                  tag: widget.stadium.name,
                  child: Image(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/' + widget.stadium.image),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 8,
              color: Colors.grey[400],
            ),
          ),
          Positioned(
            right: 32,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    widget.stadium.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    CustomIcons.star,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
