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
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleSection(),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stadium:' + widget.stadium.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        CustomIcons.pin_location,
                        size: 14,
                        color: HexColor('#C6C6CD'),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      // Text(
                      //   widget.stadium.location,
                      //   style: TextStyle(
                      //     color: HexColor('#C6C6CD'),
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  //   decoration: BoxDecoration(
                  //     color: HexColor('#FFF9EA'),
                  //     border: Border.all(color: HexColor('#FFEDBE'), width: 1),
                  //     borderRadius: BorderRadius.circular(4),
                  //   ),
                  //   child: Text(
                  //     widget.stadium.type + ' Specialist',
                  //     style: TextStyle(
                  //       color: HexColor('#FFBF11'),
                  //       fontSize: 11,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
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
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 91,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DetailCell(title: '300k', subTitle: 'People'),
                        DetailCell(title: '70', subTitle: 'Trophys'),
                        DetailCell(title: '2.3B', subTitle: 'Fans'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Tip: Mohamed Solah 2022/2033 BallonDor Winner',
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
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
      backgroundColor: HexColor('#00C6AD'),
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
      color: HexColor('#00C6AD'),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 207,
              height: 178,
              child: Image(
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/bg_shape.png'),
              ),
            ),
          ),
          Positioned(
            right: 64,
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
              height: 15,
              color: Colors.white,
            ),
          ),
          Positioned(
            right: 32,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: HexColor('#FFBB23'),
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
