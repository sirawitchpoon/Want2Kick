import 'package:flutter/material.dart';
import 'package:want_2_kick/models/stadium.dart';
import 'package:want_2_kick/utils/custom_icons_icons.dart';
import 'package:want_2_kick/utils/he_color.dart';

class TrdCell extends StatelessWidget {
  final Stadium stadium;

  const TrdCell({Key? key, required this.stadium}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (() => onTap(),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: HexColor('#404B63').withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSection(),
            SizedBox(
              width: 16,
            ),
            _detailsSection(),
          ],
        ),
      ),
    );
  }

  Container _imageSection() {
    return Container(
      height: 77,
      width: 90,
      decoration: BoxDecoration(
        color: HexColor('#00C6AD'),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/' + stadium.image),
        ),
      ),
    );
  }

  Column _detailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              stadium.rating.toString(),
              style: TextStyle(
                color: HexColor('#929BB0'),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              CustomIcons.star,
              color: HexColor('#FFBB23'),
              size: 14,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          stadium.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          stadium.price,
          style: TextStyle(
            color: HexColor('#929BB0'),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
